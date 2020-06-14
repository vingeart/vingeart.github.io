// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33507,y:32562,varname:node_4013,prsc:2|diff-4780-OUT,spec-4675-OUT,normal-955-OUT,emission-2964-OUT;n:type:ShaderForge.SFN_Tex2d,id:6050,x:33037,y:31945,ptovrint:True,ptlb:Layer 1,ptin:_Splat0,varname:_Splat0,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:67a7095b1238db8458a6b490b3efe2f6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8803,x:32881,y:32133,ptovrint:True,ptlb:Layer 2,ptin:_Splat1,varname:_Splat1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:209196ce836153c47aa918f0b47a3d54,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7157,x:33037,y:32201,ptovrint:True,ptlb:Layer 3,ptin:_Splat2,varname:_Splat2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f3a409667b5d4f944ae3a0e64cf59316,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4138,x:33199,y:32284,ptovrint:True,ptlb:Layer 4,ptin:_Splat3,varname:_Splat3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b75732c80ce620b4b926ac28d79b664f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:4089,x:33247,y:32094,varname:node_4089,prsc:2,chbt:1|M-3099-OUT,R-6050-RGB,G-8803-RGB,B-7157-RGB,BTM-4138-RGB;n:type:ShaderForge.SFN_Tex2d,id:5763,x:33201,y:32860,ptovrint:True,ptlb:Control (RGBA),ptin:_Control,varname:_Control,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:786ad4366adae3d41bccd17451e5abfd,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9706,x:32281,y:31971,ptovrint:True,ptlb:Layer1Normalmap,ptin:_BumpSplat0,varname:_BumpSplat0,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:93e72a49ba4aa1e41bc782af0f9cdd69,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:3496,x:32129,y:32122,ptovrint:True,ptlb:Layer2Normalmap,ptin:_BumpSplat1,varname:_BumpSplat1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6f5ba69a052963d4ab392cb4ea6bf4cb,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:4781,x:32281,y:32212,ptovrint:True,ptlb:Layer3Normalmap,ptin:_BumpSplat2,varname:_BumpSplat2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:936c5c3cafeab7c44896800d23df9017,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:8116,x:32450,y:32266,ptovrint:True,ptlb:Layer4Normalmap,ptin:_BumpSplat3,varname:_BumpSplat3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d2bcc3b23dcd9fc48a7ca51965c56b4e,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:9188,x:32090,y:32511,ptovrint:True,ptlb:Layer1Shininess,ptin:_ShininessL0,varname:_ShininessL0,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8ab910eb926985945bcced3f8a581c40,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5109,x:31772,y:32745,ptovrint:True,ptlb:Layer2Shininess,ptin:_ShininessL1,varname:_ShininessL1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:83eef1189737aba488a1141aae28ea70,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:573,x:32247,y:32782,ptovrint:True,ptlb:Layer3Shininess,ptin:_ShininessL2,varname:_ShininessL2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1b07e47cc8da03647b0b755b80276383,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5540,x:31915,y:33032,ptovrint:True,ptlb:Layer4Shininess,ptin:_ShininessL3,varname:_ShininessL3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5e474eb1627b3124d84708f3feb9d9e8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:8475,x:32623,y:32828,varname:node_8475,prsc:2,chbt:1|M-4697-OUT,R-783-OUT,G-2699-OUT,B-2432-OUT,BTM-1450-OUT;n:type:ShaderForge.SFN_Multiply,id:783,x:32258,y:32624,varname:node_783,prsc:2|A-9188-R,B-4264-OUT;n:type:ShaderForge.SFN_Slider,id:4264,x:31933,y:32735,ptovrint:False,ptlb:Layer1SpecularIntensity,ptin:_Layer1SpecularIntensity,varname:_Layer1SpecularIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5607456,max:1;n:type:ShaderForge.SFN_Multiply,id:2699,x:31947,y:32858,varname:node_2699,prsc:2|A-5109-R,B-6381-OUT;n:type:ShaderForge.SFN_Slider,id:6381,x:31615,y:32966,ptovrint:False,ptlb:Layer2SpecularIntensity,ptin:_Layer2SpecularIntensity,varname:_Layer2SpecularIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:2432,x:32420,y:32896,varname:node_2432,prsc:2|A-573-R,B-8161-OUT;n:type:ShaderForge.SFN_Slider,id:8161,x:32090,y:33012,ptovrint:False,ptlb:Layer3SpecularIntensity,ptin:_Layer3SpecularIntensity,varname:_Layer3SpecularIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:1450,x:32090,y:33141,varname:node_1450,prsc:2|A-5540-R,B-3713-OUT;n:type:ShaderForge.SFN_Slider,id:3713,x:31758,y:33258,ptovrint:False,ptlb:Layer4SpecularIntensity,ptin:_Layer4SpecularIntensity,varname:_Layer4SpecularIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_ChannelBlend,id:5142,x:32490,y:32073,varname:node_5142,prsc:2,chbt:1|M-9636-OUT,R-9706-RGB,G-3496-RGB,B-4781-RGB,BTM-8116-RGB;n:type:ShaderForge.SFN_Set,id:2003,x:33350,y:32860,varname:Mask,prsc:2|IN-5763-RGB;n:type:ShaderForge.SFN_Get,id:3099,x:33251,y:31927,varname:DiffuseMask,prsc:2|IN-2003-OUT;n:type:ShaderForge.SFN_Get,id:9636,x:32445,y:31954,varname:NormalMask,prsc:2|IN-2003-OUT;n:type:ShaderForge.SFN_Get,id:4697,x:32420,y:32733,varname:SpecularMask,prsc:2|IN-2003-OUT;n:type:ShaderForge.SFN_Set,id:1520,x:32776,y:32828,varname:SetSpecular,prsc:2|IN-8475-OUT;n:type:ShaderForge.SFN_Get,id:4675,x:33327,y:32597,varname:node_4675,prsc:2|IN-1520-OUT;n:type:ShaderForge.SFN_Get,id:955,x:33337,y:32648,varname:node_955,prsc:2|IN-5327-OUT;n:type:ShaderForge.SFN_Set,id:5327,x:32675,y:32086,varname:SetNormal,prsc:2|IN-5142-OUT;n:type:ShaderForge.SFN_Set,id:8841,x:33435,y:32094,varname:SetDiffuse,prsc:2|IN-4089-OUT;n:type:ShaderForge.SFN_Get,id:4780,x:33143,y:32534,varname:GetDiffuse,prsc:2|IN-8841-OUT;n:type:ShaderForge.SFN_Multiply,id:2964,x:33337,y:32705,varname:node_2964,prsc:2|A-4780-OUT,B-9390-OUT;n:type:ShaderForge.SFN_Slider,id:9390,x:33007,y:32732,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:_Emission,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;proporder:9390-6050-8803-7157-4138-5763-9706-3496-4781-8116-9188-4264-5109-6381-573-8161-5540-3713;pass:END;sub:END;*/

Shader "Shader Forge/T4M 4 TexturesNormalSpecular" {
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
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
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
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
////// Specular:
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
/////// Diffuse:
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
////// Emissive:
                float3 emissive = (GetDiffuse*_Emission);
/// Final Color:
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
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
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
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
/////// Diffuse:
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
/// Final Color:
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
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
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
