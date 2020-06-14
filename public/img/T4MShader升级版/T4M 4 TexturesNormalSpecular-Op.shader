Shader "MyMobile/T4M 4 TexturesNormalSpecular" {
    Properties {
        _Emission ("Emission", Range(0, 1)) = 0.5
        _Splat0 ("Layer 1", 2D) = "white" {}
        _Splat1 ("Layer 2", 2D) = "white" {}
        _Splat2 ("Layer 3", 2D) = "white" {}
        _Splat3 ("Layer 4", 2D) = "white" {}
        _Control ("Control (RGBA)", 2D) = "white" {}
        _BumpSplat0 ("Layer1Normalmap", 2D) = "bump" {}
        _BumpSplat1 ("Layer2Normalmap", 2D) = "bump" {}
        _BumpSplat2 ("Layer3Normalmap", 2D) = "bump" {}
        _BumpSplat3 ("Layer4Normalmap", 2D) = "bump" {}
        _ShininessL0 ("Layer1Shininess", 2D) = "white" {}
        _Layer1SpecularIntensity ("Layer1SpecularIntensity", Range(0, 1)) = 0.5607456
        _ShininessL1 ("Layer2Shininess", 2D) = "white" {}
        _Layer2SpecularIntensity ("Layer2SpecularIntensity", Range(0, 1)) = 0.5
        _ShininessL2 ("Layer3Shininess", 2D) = "white" {}
        _Layer3SpecularIntensity ("Layer3SpecularIntensity", Range(0, 1)) = 0.5
        _ShininessL3 ("Layer4Shininess", 2D) = "white" {}
        _Layer4SpecularIntensity ("Layer4SpecularIntensity", Range(0, 1)) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0

            uniform sampler2D _Splat0; uniform float4 _Splat0_ST;
            uniform sampler2D _Splat1; uniform float4 _Splat1_ST;
            uniform sampler2D _Splat2; uniform float4 _Splat2_ST;
            uniform sampler2D _Splat3; uniform float4 _Splat3_ST;
            uniform sampler2D _Control; uniform float4 _Control_ST;
            uniform sampler2D _BumpSplat0; uniform float4 _BumpSplat0_ST;
            uniform sampler2D _BumpSplat1; uniform float4 _BumpSplat1_ST;
            uniform sampler2D _BumpSplat2; uniform float4 _BumpSplat2_ST;
            uniform sampler2D _BumpSplat3; uniform float4 _BumpSplat3_ST;
            uniform sampler2D _ShininessL0; uniform float4 _ShininessL0_ST;
            uniform sampler2D _ShininessL1; uniform float4 _ShininessL1_ST;
            uniform sampler2D _ShininessL2; uniform float4 _ShininessL2_ST;
            uniform sampler2D _ShininessL3; uniform float4 _ShininessL3_ST;
            uniform float _Layer1SpecularIntensity;
            uniform float _Layer2SpecularIntensity;
            uniform float _Layer3SpecularIntensity;
            uniform float _Layer4SpecularIntensity;
            uniform float _Emission;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _Control_var = tex2D(_Control,TRANSFORM_TEX(i.uv0, _Control));
                float3 Mask = _Control_var.rgb;
                float3 NormalMask = Mask;
                float3 _BumpSplat3_var = UnpackNormal(tex2D(_BumpSplat3,TRANSFORM_TEX(i.uv0, _BumpSplat3)));
                float3 _BumpSplat0_var = UnpackNormal(tex2D(_BumpSplat0,TRANSFORM_TEX(i.uv0, _BumpSplat0)));
                float3 _BumpSplat1_var = UnpackNormal(tex2D(_BumpSplat1,TRANSFORM_TEX(i.uv0, _BumpSplat1)));
                float3 _BumpSplat2_var = UnpackNormal(tex2D(_BumpSplat2,TRANSFORM_TEX(i.uv0, _BumpSplat2)));
                float3 SetNormal = (lerp( lerp( lerp( _BumpSplat3_var.rgb, _BumpSplat0_var.rgb, NormalMask.r ), _BumpSplat1_var.rgb, NormalMask.g ), _BumpSplat2_var.rgb, NormalMask.b ));
                float3 normalLocal = SetNormal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 SpecularMask = Mask;
                float4 _ShininessL3_var = tex2D(_ShininessL3,TRANSFORM_TEX(i.uv0, _ShininessL3));
                float4 _ShininessL0_var = tex2D(_ShininessL0,TRANSFORM_TEX(i.uv0, _ShininessL0));
                float4 _ShininessL1_var = tex2D(_ShininessL1,TRANSFORM_TEX(i.uv0, _ShininessL1));
                float4 _ShininessL2_var = tex2D(_ShininessL2,TRANSFORM_TEX(i.uv0, _ShininessL2));
                float SetSpecular = (lerp( lerp( lerp( (_ShininessL3_var.r*_Layer4SpecularIntensity), (_ShininessL0_var.r*_Layer1SpecularIntensity), SpecularMask.r ), (_ShininessL1_var.r*_Layer2SpecularIntensity), SpecularMask.g ), (_ShininessL2_var.r*_Layer3SpecularIntensity), SpecularMask.b ));
                float node_4675 = SetSpecular;
                float3 specularColor = float3(node_4675,node_4675,node_4675);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 DiffuseMask = Mask;
                float4 _Splat3_var = tex2D(_Splat3,TRANSFORM_TEX(i.uv0, _Splat3));
                float4 _Splat0_var = tex2D(_Splat0,TRANSFORM_TEX(i.uv0, _Splat0));
                float4 _Splat1_var = tex2D(_Splat1,TRANSFORM_TEX(i.uv0, _Splat1));
                float4 _Splat2_var = tex2D(_Splat2,TRANSFORM_TEX(i.uv0, _Splat2));
                float3 SetDiffuse = (lerp( lerp( lerp( _Splat3_var.rgb, _Splat0_var.rgb, DiffuseMask.r ), _Splat1_var.rgb, DiffuseMask.g ), _Splat2_var.rgb, DiffuseMask.b ));
                float3 GetDiffuse = SetDiffuse;
                float3 diffuseColor = GetDiffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
                float3 emissive = (GetDiffuse*_Emission);
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0

            uniform sampler2D _Splat0; uniform float4 _Splat0_ST;
            uniform sampler2D _Splat1; uniform float4 _Splat1_ST;
            uniform sampler2D _Splat2; uniform float4 _Splat2_ST;
            uniform sampler2D _Splat3; uniform float4 _Splat3_ST;
            uniform sampler2D _Control; uniform float4 _Control_ST;
            uniform sampler2D _BumpSplat0; uniform float4 _BumpSplat0_ST;
            uniform sampler2D _BumpSplat1; uniform float4 _BumpSplat1_ST;
            uniform sampler2D _BumpSplat2; uniform float4 _BumpSplat2_ST;
            uniform sampler2D _BumpSplat3; uniform float4 _BumpSplat3_ST;
            uniform sampler2D _ShininessL0; uniform float4 _ShininessL0_ST;
            uniform sampler2D _ShininessL1; uniform float4 _ShininessL1_ST;
            uniform sampler2D _ShininessL2; uniform float4 _ShininessL2_ST;
            uniform sampler2D _ShininessL3; uniform float4 _ShininessL3_ST;
            uniform float _Layer1SpecularIntensity;
            uniform float _Layer2SpecularIntensity;
            uniform float _Layer3SpecularIntensity;
            uniform float _Layer4SpecularIntensity;
            uniform float _Emission;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _Control_var = tex2D(_Control,TRANSFORM_TEX(i.uv0, _Control));
                float3 Mask = _Control_var.rgb;
                float3 NormalMask = Mask;
                float3 _BumpSplat3_var = UnpackNormal(tex2D(_BumpSplat3,TRANSFORM_TEX(i.uv0, _BumpSplat3)));
                float3 _BumpSplat0_var = UnpackNormal(tex2D(_BumpSplat0,TRANSFORM_TEX(i.uv0, _BumpSplat0)));
                float3 _BumpSplat1_var = UnpackNormal(tex2D(_BumpSplat1,TRANSFORM_TEX(i.uv0, _BumpSplat1)));
                float3 _BumpSplat2_var = UnpackNormal(tex2D(_BumpSplat2,TRANSFORM_TEX(i.uv0, _BumpSplat2)));
                float3 SetNormal = (lerp( lerp( lerp( _BumpSplat3_var.rgb, _BumpSplat0_var.rgb, NormalMask.r ), _BumpSplat1_var.rgb, NormalMask.g ), _BumpSplat2_var.rgb, NormalMask.b ));
                float3 normalLocal = SetNormal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 SpecularMask = Mask;
                float4 _ShininessL3_var = tex2D(_ShininessL3,TRANSFORM_TEX(i.uv0, _ShininessL3));
                float4 _ShininessL0_var = tex2D(_ShininessL0,TRANSFORM_TEX(i.uv0, _ShininessL0));
                float4 _ShininessL1_var = tex2D(_ShininessL1,TRANSFORM_TEX(i.uv0, _ShininessL1));
                float4 _ShininessL2_var = tex2D(_ShininessL2,TRANSFORM_TEX(i.uv0, _ShininessL2));
                float SetSpecular = (lerp( lerp( lerp( (_ShininessL3_var.r*_Layer4SpecularIntensity), (_ShininessL0_var.r*_Layer1SpecularIntensity), SpecularMask.r ), (_ShininessL1_var.r*_Layer2SpecularIntensity), SpecularMask.g ), (_ShininessL2_var.r*_Layer3SpecularIntensity), SpecularMask.b ));
                float node_4675 = SetSpecular;
                float3 specularColor = float3(node_4675,node_4675,node_4675);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 DiffuseMask = Mask;
                float4 _Splat3_var = tex2D(_Splat3,TRANSFORM_TEX(i.uv0, _Splat3));
                float4 _Splat0_var = tex2D(_Splat0,TRANSFORM_TEX(i.uv0, _Splat0));
                float4 _Splat1_var = tex2D(_Splat1,TRANSFORM_TEX(i.uv0, _Splat1));
                float4 _Splat2_var = tex2D(_Splat2,TRANSFORM_TEX(i.uv0, _Splat2));
                float3 SetDiffuse = (lerp( lerp( lerp( _Splat3_var.rgb, _Splat0_var.rgb, DiffuseMask.r ), _Splat1_var.rgb, DiffuseMask.g ), _Splat2_var.rgb, DiffuseMask.b ));
                float3 GetDiffuse = SetDiffuse;
                float3 diffuseColor = GetDiffuse;
                float3 diffuse = directDiffuse * diffuseColor;
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma target 3.0

            uniform sampler2D _Splat0; uniform float4 _Splat0_ST;
            uniform sampler2D _Splat1; uniform float4 _Splat1_ST;
            uniform sampler2D _Splat2; uniform float4 _Splat2_ST;
            uniform sampler2D _Splat3; uniform float4 _Splat3_ST;
            uniform sampler2D _Control; uniform float4 _Control_ST;
            uniform sampler2D _ShininessL0; uniform float4 _ShininessL0_ST;
            uniform sampler2D _ShininessL1; uniform float4 _ShininessL1_ST;
            uniform sampler2D _ShininessL2; uniform float4 _ShininessL2_ST;
            uniform sampler2D _ShininessL3; uniform float4 _ShininessL3_ST;
            uniform float _Layer1SpecularIntensity;
            uniform float _Layer2SpecularIntensity;
            uniform float _Layer3SpecularIntensity;
            uniform float _Layer4SpecularIntensity;
            uniform float _Emission;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _Control_var = tex2D(_Control,TRANSFORM_TEX(i.uv0, _Control));
                float3 Mask = _Control_var.rgb;
                float3 DiffuseMask = Mask;
                float4 _Splat3_var = tex2D(_Splat3,TRANSFORM_TEX(i.uv0, _Splat3));
                float4 _Splat0_var = tex2D(_Splat0,TRANSFORM_TEX(i.uv0, _Splat0));
                float4 _Splat1_var = tex2D(_Splat1,TRANSFORM_TEX(i.uv0, _Splat1));
                float4 _Splat2_var = tex2D(_Splat2,TRANSFORM_TEX(i.uv0, _Splat2));
                float3 SetDiffuse = (lerp( lerp( lerp( _Splat3_var.rgb, _Splat0_var.rgb, DiffuseMask.r ), _Splat1_var.rgb, DiffuseMask.g ), _Splat2_var.rgb, DiffuseMask.b ));
                float3 GetDiffuse = SetDiffuse;
                o.Emission = (GetDiffuse*_Emission);
                
                float3 diffColor = GetDiffuse;
                float3 SpecularMask = Mask;
                float4 _ShininessL3_var = tex2D(_ShininessL3,TRANSFORM_TEX(i.uv0, _ShininessL3));
                float4 _ShininessL0_var = tex2D(_ShininessL0,TRANSFORM_TEX(i.uv0, _ShininessL0));
                float4 _ShininessL1_var = tex2D(_ShininessL1,TRANSFORM_TEX(i.uv0, _ShininessL1));
                float4 _ShininessL2_var = tex2D(_ShininessL2,TRANSFORM_TEX(i.uv0, _ShininessL2));
                float SetSpecular = (lerp( lerp( lerp( (_ShininessL3_var.r*_Layer4SpecularIntensity), (_ShininessL0_var.r*_Layer1SpecularIntensity), SpecularMask.r ), (_ShininessL1_var.r*_Layer2SpecularIntensity), SpecularMask.g ), (_ShininessL2_var.r*_Layer3SpecularIntensity), SpecularMask.b ));
                float node_4675 = SetSpecular;
                float3 specColor = float3(node_4675,node_4675,node_4675);
                o.Albedo = diffColor + specColor * 0.125; // No gloss connected. Assume it's 0.5
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack Off
}