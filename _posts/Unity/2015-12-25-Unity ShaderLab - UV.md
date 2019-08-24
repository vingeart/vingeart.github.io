---
layout: post
title: Unity ShaderLab - UV
category: [Unity]
tags: [Unity, Shader, UV]
published: True
---


`声明：版权所有，禁止匿名转载；禁止商业使用。`


## UV各计算公式：

UV缩放：uv = uv * float2(X,Y)

UV偏移：uv = uv + float2(X,Y)

UV旋转：

X轴 = cos(旋转角度) * uv.x - sin(旋转角度) * uv.y

Y轴 = cos(旋转角度)* uv.y + sin(旋转角度) * uv.x

UV = float2(cos(旋转角度) * uv.x - sin(旋转角度) * uv.y , cos(旋转角度) * uv.y + sin(旋转角度) * uv.x)


## UV缩放：

    Shader "VinGe/TestUvTiling" {
		Properties {
			_Color ("Color", Color) = (1,1,1,1)
			_MainTex ("Albedo (RGB)", 2D) = "white" {}
			_Glossiness ("Smoothness", Range(0,1)) = 0.5
			_Metallic ("Metallic", Range(0,1)) = 0.0
			_TilingX ("TilingX",float) = 1	//X轴缩放
			_TilingY ("TilingY",float) = 1	//Y轴缩放
	
		}
		SubShader {
			Tags { "RenderType"="Opaque" }
			LOD 200
			
			CGPROGRAM
			// 基于物理标准照明模型,使阴影所有光类型
			#pragma surface surf Standard fullforwardshadows
	
			// 用着色模型3.0的目标,获得更好的照明
			#pragma target 3.0
	
			sampler2D _MainTex;
			float _TilingX;
			float _TilingY;
	
	
			struct Input {
				float2 uv_MainTex;
			};
	
			half _Glossiness;
			half _Metallic;
			fixed4 _Color;
	
			void surf (Input IN, inout SurfaceOutputStandard o) {
				//定义UV
				float2 uv = IN.uv_MainTex;
				
				//缩放UV
				uv = uv * float2(1/_TilingX,1/_TilingY);
				
				// 贴图和颜色
				fixed4 c = tex2D (_MainTex, uv) * _Color;
				o.Albedo = c.rgb;
				
				// 金属滑块和平滑的变量
				o.Metallic = _Metallic;
				o.Smoothness = _Glossiness;
				o.Alpha = c.a;
			}
			ENDCG
		} 
	}


## UV偏移：

	Shader "VinGe/TestUvOffset" {
		Properties {
			_Color ("Color", Color) = (1,1,1,1)
			_MainTex ("Albedo (RGB)", 2D) = "white" {}
			_Glossiness ("Smoothness", Range(0,1)) = 0.5
			_Metallic ("Metallic", Range(0,1)) = 0.0
			//_OffsetX ("OffsetX",float) = 1
			_OffsetY ("OffsetY",float) = 1
		}
		SubShader {
			Tags { "RenderType"="Opaque" }
			LOD 200
			
			CGPROGRAM
			// 基于物理标准照明模型,使阴影所有光类型
			#pragma surface surf Standard fullforwardshadows
	
			// 用着色模型3.0的目标,获得更好的照明
			#pragma target 3.0
	
			sampler2D _MainTex;
			float _OffsetX;
			float _OffsetY;
	
			struct Input {
				float2 uv_MainTex;
			};
	
			half _Glossiness;
			half _Metallic;
			fixed4 _Color;
	
			void surf (Input IN, inout SurfaceOutputStandard o) {
				//定义UV
				float2 uv = IN.uv_MainTex;
				
				//UV偏移
				_OffsetX = _Time.x * 5;	//X轴随着时间的加大
				uv = uv + float2(_OffsetX,_OffsetY);
				
				// 贴图和颜色
				fixed4 c = tex2D (_MainTex, uv) * _Color;
				o.Albedo = c.rgb;
				
				// 金属滑块和平滑的变量
				o.Metallic = _Metallic;
				o.Smoothness = _Glossiness;
				o.Alpha = c.a;
			}
			ENDCG
		} 
		FallBack "Diffuse"
	}


## UV旋转：

	Shader "VinGe/TestUvRotation" {
		Properties {
			_Color ("Color", Color) = (1,1,1,1)
			_MainTex ("Albedo (RGB)", 2D) = "white" {}
			_Glossiness ("Smoothness", Range(0,1)) = 0.5
			_Metallic ("Metallic", Range(0,1)) = 0.0
			_Rotation ("Rotation",float) = 0
	
		}
		SubShader {
			Tags { "RenderType"="Opaque" }
			LOD 200
			
			CGPROGRAM
			// 基于物理标准照明模型,使阴影所有光类型
			#pragma surface surf Standard fullforwardshadows
	
			// 用着色模型3.0的目标,获得更好的照明
			#pragma target 3.0
	
			sampler2D _MainTex;
			float _Rotation;
	
			struct Input {
				float2 uv_MainTex;
			};
	
			half _Glossiness;
			half _Metallic;
			fixed4 _Color;
	
			void surf (Input IN, inout SurfaceOutputStandard o) {
				//定义UV
				float2 uv = IN.uv_MainTex;
				
				//UV旋转
				_Rotation = _Time.w;	//随着时间_Rotation值加大
				uv = float2(cos(_Rotation)*uv.x-sin(_Rotation)*uv.y,cos(_Rotation)*uv.y+sin(_Rotation)*uv.x);
				
				// 贴图和颜色
				fixed4 c = tex2D (_MainTex, uv) * _Color;
				o.Albedo = c.rgb;
				
				// 金属滑块和平滑的变量
				o.Metallic = _Metallic;
				o.Smoothness = _Glossiness;
				o.Alpha = c.a;
			}
			ENDCG
		} 
		FallBack "Diffuse"
	}