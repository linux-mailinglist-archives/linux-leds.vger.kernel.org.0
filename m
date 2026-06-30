Return-Path: <linux-leds+bounces-8806-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BH9gDWuJQ2p1agoAu9opvQ
	(envelope-from <linux-leds+bounces-8806-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 11:16:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE476E2021
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 11:16:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cGDZAUsT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FvepGzCI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8806-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8806-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A96A130317E2
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 09:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0F63E8C56;
	Tue, 30 Jun 2026 09:10:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01A3E8C5B
	for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810602; cv=none; b=Ja0Cn+NPQgII+8aPKsq9xE7DV5FshniUNYJiWruDE5yPZ4KgmUjtaiVIfeDWYBv6w+u4zIGhX8XQyuRHpxJKhzP1eLs4lhW5d4d3oayO2yoll3PczjnRDcU14CejdJn6FYUR0kDtEjbUmK8FX4bwDFgLmbPTWlCMjgW1OcnwFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810602; c=relaxed/simple;
	bh=ptOVKjkZwQrCkAzXCeGoGqQIndI7yCJPdxRUgantAbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ajdw6vi4SUA8Nq378DVLcecUI/oNhrbY8BKrTx6J+00d314BshtD+0sFTFBMiQvKDCB07d+2MLN5EW2FDDw3yopu11Xbhuet9u1sFL10o5HDhSxCdqKAEE4kI6lDPd4G8ti0PLqdHz9NR5xLW9BCavxjiq/mrbbWXj5PTklt4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGDZAUsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvepGzCI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHYU1030630
	for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=; b=cGDZAUsT3321ar0Q
	uIQFG4OLlUrBeZEamVCCDLodlgM15gM6zvaxGyFFi/3AsaNK4jlmGayPocuhyX3X
	MEkBKu0NbZqY1RnLAKPRPc0DNSrphwYe8n4NYzUUtRRflsW6/2XN5zEgEECAjO3l
	9klmoiitBGvgqPY+lSlecpwztSiCYz/RAxlSzKlfgARJLOqdWtVEC9+sBoWXiN9D
	rVt725k0BNLLTQ8dA7B6tjgetPrsD6C/Uw64+78PaWnlCeKOOtH/SiYTZBeVuI0j
	XhV3XK1ZbPoYb/1EuZniWCb/JNu5YXWBpEXJTbwcjQHip4vEENAhqUo7eHv3iJm6
	fuEz0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1hsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 09:10:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so1070585a.3
        for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810599; x=1783415399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=;
        b=FvepGzCIjL+5t7EA4AfGfToMjR/RI4dYDsqj8co/eY4cL0QOm5RgrB3QbyU+ejHRZf
         HViD9ECWHdkgO+4GgIQXaQV68jX+m+a/a+77DMIAUo9JvP7FNsenFx030u324zpwwvVh
         7W2ivhFPBDzwXjd07KGaGi6jb3GmcTNgptgW6vJ7ER5531q9TuEr9BMncIoVp9qNKUS+
         MQTs67d0fURr+aWo486fC74ZweX6KdnkCckQ7giVj2UqrX3qljbdnH4QRsbaGVU9vNTl
         KnQrscYJh+IzAJsruxxge7okPY2F7PLBe2tpwzRSrZX4DTWG7nwyj1C2G3cFEMET8ZGm
         t73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810599; x=1783415399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkFq0X6wqxVvjJjzcRaiua/SKPg3yw+BNzWanfKbdtY=;
        b=oWgk8bhzvEnYd3b4OQlqjUYXchkY/I573PQjjJS+GXfDL15XZq6XznkYNxdynVn5xg
         R+gvyxkVGxJTk1UNv3cuYMMde6dCUkWRqPOfYwFSzARyrJhJg9iTR2b68RnCCyHzV0Te
         JhMul/cF+c5ASIAXOPGwKrLtej1ep1FLB99b7Jh3wxWKZD+8G+55FZmsN2nbHJjlqcyj
         0fH6pH37Gi+nRcDIcKkXL+2DfO5s33nBJthNaqu7EOCzRN7mQM+TgkIwaqHBfNGLFdwf
         cmYTH2Uog1ogqeZvBeeBQmZgtTUA9iY++7ClErX3+8dj62YQH3/g1HNDM6JdVxACJLtf
         5vcQ==
X-Gm-Message-State: AOJu0YxwhjBzx7A0KU/iHTpAiYY9MgOYOn03cdK7HPeirCdvepyFjDJb
	elWFOws01fxlhhbcX493uEiWusgzseBGSIiv3xUqvzgT8v9cfCZ12amkuv8Z8O7ZiWJL9oiqB+l
	8p+S/qyJHa/V1HOpJvhSxVlRk8qVm14uHmQVVoxZGQcieutZBPjoiKGj25WB+ldL5
X-Gm-Gg: AfdE7cls1oH4c+rAq8OItoxPeQNAwTtS7tmHY4TpUd2ZXE38ES35JL3YHqBBFZVs+Xt
	GP/299RJtU52NN73vstpbLuPMPNZwgQRQeqQcMjFy93QZmd81ndGIIl5Khlo23BkU8sB8KbD5Zd
	xKiTsNCO7ImDbOU1Od2M5VC/JQxqFCJM3i7RNJTo0CXrg1u7BW3QlPHGMpIZ0tTkpP3oAjHO002
	mQGF1PpJRfuKJQ1YMEz/9fG0K4zY7O1luwEB8hcIgJvs928/h/ywRu+g2acxpETrJihLL+wgdoQ
	/8s2K1jEnwt7vhhXJbibblTUaDOdX2ODqOesAfkY/wflx/Ufw0VcqaS2uFPELNVJND4/nztG5fx
	oLmXaY+Yf5LdwIqcwu1BkI0nBIlPFydB0ehc=
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr24049591cf.1.1782810599007;
        Tue, 30 Jun 2026 02:09:59 -0700 (PDT)
X-Received: by 2002:ac8:7e8e:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c1070ea79mr24049421cf.1.1782810598476;
        Tue, 30 Jun 2026 02:09:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b059sm89407566b.21.2026.06.30.02.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:09:57 -0700 (PDT)
Message-ID: <7c29b53d-54e0-4667-b775-02e3c01ead3a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eZI_StdahITGUvvJalj6OVm15fXRMXbx
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a4387e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mmkDOsKAXys1VAjLnNcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eZI_StdahITGUvvJalj6OVm15fXRMXbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfX1yrcS3Zw9QYP
 tJX8AdeN2pe4M0Bw1gnzo6YBfa62aH51nA7bQWwXjp/XiugR5zetFu6lWdCtMSYKIxP+8sEH27M
 yfdTauVgkDzHgWkyAszSNwEg5dEsJSQIbffHNldV2jc1dtD0yrDF7A7xzvOECUyhCIlhTdhwA92
 DWH8PZz5+HDKrd7Eu3o8/tSUUSD4HHyfIdrg8EHvmQfp8J9l8xHGueiJ1UROJ58Ku36p1ZRWLIl
 vonII0CEv8kr8HT2jnvjkr0+j4xXYfFQBvgUyct/B/mn/3ZPTEq94Vt+6xiZPkpHoAsnQL2A72h
 0rXecwp2FvedAqbcSoxgMav8rB+qin2xTzfZ72Mwb5E8rFxSrkHSfZYovhJLN1kJAYKBVF+PqkP
 ygQ+akuoKvGoRvBw2IK6DSb7KUVGXTsdW55rXc5YNN2eP0hWv+KafFEyc9VexChZQryR61+VwYm
 TIh/wkJYIIo6BSfAOTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfX3F7JOXHOsJ3o
 d/+b47S74wMRqnX0kD8b4ENpyZUtqQjn/HBqxU+h7TGReg643aLokMCh6mEKD70k1G1nCuWJv7w
 igsxwC2OqmI4SgZno6jGNnOej2Y3IKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8806-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DE476E2021

On 6/29/26 9:52 PM, Loic Poulain wrote:
> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4c8f6b7712c5d340b20be1b9217c..71685e54a3781c9b03fc41cacecfea77650a7182 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  #include "monaco.dtsi"
> @@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
>  	};
>  };
>  
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	leds_controller: leds-controller@22 {

unused label, let's drop it

led-controller@ (there is no other 'leds'-controller)

> +		compatible = "nxp,pca9635";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x22>;

reg right after compatible, please

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


