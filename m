Return-Path: <linux-leds+bounces-7983-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH9mGhS0+Gm3zAIAu9opvQ
	(envelope-from <linux-leds+bounces-7983-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 16:58:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 071144C047B
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 16:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 892A7301B700
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 14:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336FC3E0242;
	Mon,  4 May 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kY5WOLG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7i563PH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFE3DFC9B
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906466; cv=none; b=p9GRQ3orflwNBoo1mXjTF7SVm0PAGw8e2dKgDnQfGc+snd3YO8l/vJpw2DXb8p6E76n/SLTzdXwJZVSnWpMhaOUm54T45Bh9PNK+wppcZQx4mAj2dFCM3IrBMIU6tpvrtOYjq3R+664ZGSqwahi/YweBZgu5LWB8zvxjomSmXLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906466; c=relaxed/simple;
	bh=EM+OQxzQIIOWzEayPXdXmdv512Z29ws6oLsXNS8rUh4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cE98BG3fSYwTLGKA6yady3bPnsHCJu7LLkRG6mG4QKy2bVw+Qej800pbIWAvNPshSSs1HXwMC+H1C/nhIahlBSTnsVknbJJAcckiZwdlGZ08o0QEu6eqiKplb52lE3echnvsRuhheXsxFYmmP+LWxcfEIslbxOjKoITQSPf8Hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kY5WOLG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7i563PH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DrGI1331129
	for <linux-leds@vger.kernel.org>; Mon, 4 May 2026 14:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQm0EjHOS+gMP4wlPrQuUcghTj8/5td7NI+yJWBz1b4=; b=kY5WOLG/I8tFpaOU
	SSYea/5mT3LYk/yiDfp9Xfjj1GP5yGnCrUYqlvXTQQAJVJuU+j4UvMDSZDjZ2bYZ
	MgN6R1S0LOM/nub/3iNA7auClgF5u2rj9ewOzqKnkrmzCErsGQPmiTNI0K9w2QUw
	v5rcGxDpkkbunGmHk8FOnhTjGb4GqJ9746hQ3f9QceA6Wm5E5uiOYzn+QNiM8CFV
	TL9bmLASRj5Ag6iSUvgDYazRQVnROASD/nETLBCmDbSMS9ZK662Uo3SuPZI/Rhkw
	uJnH/cHx1kj1UYexkgf0doSoXFmjVZ7zX/QzWMBc1KNdKRhaAb7dfXf4S4DzKLSK
	zKrzbQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr187wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 14:54:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752402f5e1so1885816e0c.1
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777906463; x=1778511263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQm0EjHOS+gMP4wlPrQuUcghTj8/5td7NI+yJWBz1b4=;
        b=b7i563PHzVYb8yAK179UzyWej8z6tlOhznRhZOHZCmHmpprg9Vs1qJHYP0kwR+qSja
         IVuyio+DDoh+N2reMCMgIEBEmf1eJqMxypF0PhRb6fxUKp5h3QP8b9Uf/bQmzgEl1BMe
         li7Vxs+JgeaFQj+2JkRLHEraD0Ezv7Kpszw5jJg/Aa4tsYasp+loe57IXx6E1MmzfPW4
         N8iGTQ+pnmhhJB6sQU4ZRkbI5sk2trAMVjzyLBwpSPAjCbBfpbDcElze+AA/4g2qy1Yx
         rbDQBKDMG8bDQYEKVUQzlB6FW7KVyzUgrzrGZhbVBtzpDY4uLHBr/Z+69SGc80BIRtPd
         RYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906463; x=1778511263;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQm0EjHOS+gMP4wlPrQuUcghTj8/5td7NI+yJWBz1b4=;
        b=i5oQ3fCpyELgqXDdOiiXtXV80qgezIeNvmEqCD9lM3Gtr6GDD1SYdtaAXlctFcDcXI
         DiYIxnPAg/zCqCHRp2Qzmjq2raTYq9qgZGI09SZ9OxmrIJDAQtTzTBHSiCQW4l5a/Nm1
         lPwgUJ8LiWbHyJifFRfTWt4G8TmHQI9tDf0kUeHA6kZsStEr1doyxc04X2O8RRFEPWx3
         LgFkKlvd1EgTTOKqCwydOOtsRF3p1qBoAf8jJFGSCpFsURhtwyOt1GBCE/SMbEyUX+i5
         x8x1tAEobD4hRl+oTC1nu8XiIlzRTFznaN5aj20YCWz4sefIhXlhg7qMVcGFc6s7mj55
         QRKw==
X-Forwarded-Encrypted: i=1; AFNElJ9D9MXdjz5vQsYHhqSrKsvXfs7BLbNqORNDGgNfEaA1E7aa7iou0ihphsv8RzoaCrV7/KwkJClxYcgd@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsHp8FhQ7TSr8yXsrHm1r8foo7yWQ0U1YGMn234vIbP9YZPa3
	GoiGTLZuveseEfTSujWD06OfAMYXAiiew2B8RNuoQ3jtkW4w/M5lVjBDLVR44dJOR0rm0ounZbL
	ilf/TF2mRS59OkDpump0vSrBfSoDSRrrqC3c7yrMuqC9IWEZThdEgfUtp6E9LqGbs
X-Gm-Gg: AeBDietUANG+rx1u5/uze0uKyNiFsy+8bmbl5iNKPd8SRMWauEy35llhqpprxwg/bet
	diB3eWbJwx1+NQCLgzLrEvp5RTc4/9rRwTYlHrsp06VhlADpfJJRTkzXcGGdju28DdpjbQBo12Q
	+vxt6K0+5FsbafmaCVDapGwh/NXQXJVhlKtEjDePB/PlqJ3nfBDjG9zEttdFqIgVqnLSAjdeuLT
	ex/OiA807JUW25lrUKuNdwlNkJGkIjCBH9uZAQtHs5mhr9d92Y20zey2mF4WY1Nyi1E3U1hUmJX
	L1Ax1+43Glgc3RvHenWdW3BjhkzlicnNtzmCT1AvhtR7WNSO4v605C4rHOfsHN59lVxBTGIrzYX
	KZoo76jWmVSWzbypnzhFYR/xmlOgmKfM3teF2oxvGr3jfV4vmnBZwDw==
X-Received: by 2002:a05:6122:1307:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5750c466fe8mr4315259e0c.3.1777906462614;
        Mon, 04 May 2026 07:54:22 -0700 (PDT)
X-Received: by 2002:a05:6122:1307:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5750c466fe8mr4315240e0c.3.1777906462137;
        Mon, 04 May 2026 07:54:22 -0700 (PDT)
Received: from [192.168.19.150] ([109.36.135.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28d84sm3431226a12.5.2026.05.04.07.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 07:54:19 -0700 (PDT)
Message-ID: <c36e6a7e-bae6-42b9-bf2c-f71358cf64f5@oss.qualcomm.com>
Date: Mon, 4 May 2026 16:54:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] Documentation: leds: leds-class: Document keyboard
 backlight LED class naming
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
        Edip Hazuri <edip@medip.dev>,
        =?UTF-8?Q?Mustafa_Ek=C5=9Fi?=
 <mustafa.eskieksi@gmail.com>,
        Xavier Bestel <xav@bes.tel>, linux-leds@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
 <20260406174638.320135-2-johannes.goede@oss.qualcomm.com>
 <20260430092508.GF1806155@google.com>
Content-Language: en-US, nl
In-Reply-To: <20260430092508.GF1806155@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mk5VJrRU1ePW2uETdTSFaGkS4uh1HpqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX+PPn9BWnGGkP
 wK2dqg9TVKfNWQSiLdO92Loy32yz7NGQVdey79GU8E9qHDSMXTShb/Kpgp1hDGRWF8ilMhteVBM
 STn2drwdV1xPqa/5tGFmEkfWLHnPJ1VWC/wCDYJ+vYlA8QSnJpASaL24y0UeDC4JZU5Fh493+9E
 irPEtwZFa7V17+L05IB2XzKOqI1K4jDoYjIk8PWdOJy1AZRl2oEpAuyL4Htif1eMtdjFmOXwE1h
 jIsuBVOmtsKUEjHDerSN1s3qNVsDnStf2Aq7LNFhMSAEOhkg/Kqu/wBLjlisfMGFX5DW9tT05lY
 OoA5ic37lozPEyhmXuBRjZIjGgJ+GAfoUsjd1tt5XNB+X3vZx0Sip8VoDNmdWKkBDZpI1lyEYVb
 MpmbFIU8+3HvU9btS6ZXr28nnJKfynZ0L2tbz7IABR7sXzIbxnN8fn5aixPnT3w72lR3MxD+IAx
 8pTPZaWzdg7Fux+6/kg==
X-Proofpoint-GUID: Mk5VJrRU1ePW2uETdTSFaGkS4uh1HpqC
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f8b31f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=42ONuYLmbm3caH2S/eEC+Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=evInFcbA0_ZmnDL0JfQA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-Rspamd-Queue-Id: 071144C047B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com,medip.dev,bes.tel,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-7983-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Lee,

On 30-Apr-26 11:25 AM, Lee Jones wrote:
> On Mon, 06 Apr 2026, Hans de Goede wrote:
> 
>> From: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
>>
>> Document the existing practice of always using 'kbd_backlight' for
>> the function part of LED class device names for LED class devices which
>> control single-zone keyboard backlights.
>>
>> Also extend this existing practice with a new naming scheme for keyboards
>> with zoned backlight control. There are several drivers in the works (see
>> the Link:tags below) which offer backlight control for keyboards where
>> the keyboard backlight is divided in a limited number of zones, e.g.
>> "main", "cursor" and "numpad" zones.
>>
>> It is important to agree on a consistent naming scheme for these now,
>> so that userspace can support multiple different models / vendors through
>> a single unified naming scheme.
>>
>> Link: https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
>> Link: https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
>> Link: https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/
>> Link: https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
>> Link: https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
>> Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
>> Co-authored-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> The premise is fine I think.

Great, thank you for taking a look.

>> ---
>>  Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
>> index 5db620ed27aa..d2b042519a66 100644
>> --- a/Documentation/leds/leds-class.rst
>> +++ b/Documentation/leds/leds-class.rst
>> @@ -116,6 +116,69 @@ above leaves scope for further attributes should they be needed. If sections
>>  of the name don't apply, just leave that section blank.
>>  
>>  
>> +Keyboard backlight control LED Device Naming
>> +============================================
>> +
>> +For backlit keyboards with a single brightness / color settings a single
>> +(multicolor) LED class device should be used to allow userspace to change
>> +the backlight brightness (and if possible the color). This LED class device
>> +must use "kbd_backlight" for the function part of the LED class device name.
>> +IOW the name must end with ":kbd_backlight".
>> +
>> +For backlit keyboards with multiple control zones, one (multicolor) LED class
>> +device should be used per zone. These LED class devices' name must follow:
>> +
>> +	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
>> +
>> +and <devicename> must be the same for all zones of the same keyboard.
>> +
>> +<zone_name> should be descriptive of which part of the keyboard backlight
>> +the zone covers and should be suitable for userspace to show to an end user
>> +in an UI for controlling the zones.
>> +
>> +Where possible <zone_name> should be a value already used by other
>> +zoned keyboards with a similar or identical zone layout, e.g.:
>> +
>> +<devicename>:<color>:kbd_zoned_backlight-right
>> +<devicename>:<color>:kbd_zoned_backlight-middle
>> +<devicename>:<color>:kbd_zoned_backlight-left
>> +<devicename>:<color>:kbd_zoned_backlight-corners
>> +<devicename>:<color>:kbd_zoned_backlight-wasd
>> +
>> +or:
>> +
>> +<devicename>:<color>:kbd_zoned_backlight-main
>> +<devicename>:<color>:kbd_zoned_backlight-cursor
>> +<devicename>:<color>:kbd_zoned_backlight-numpad
>> +<devicename>:<color>:kbd_zoned_backlight-corners
>> +<devicename>:<color>:kbd_zoned_backlight-wasd
>> +
>> +Note that this is intended for keyboards with a limited number of zones,
>> +keyboards with per key addressable backlighting must not use LED class devices
>> +since the sysfs API is not suitable for rapidly change multiple LEDs in one
>> +"commit" as is necessary to do animations / special effects on such keyboards.
>> +
>> +An exception to the rule that all zones must follow:
>> +
>> +	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
>> +
>> +is made for the special case where there is a single big zone which controls
>> +the backlighting of almost all of the keyboard and there are some small areas
>> +with separate control, like just the 4 cursor keys, or the WASD keys. In this
>> +case the main zone should use 'kbd_backlight' for the function part of the name
>> +for compatiblity with (older) userspace code which is not aware of
> 
> Nit: compatibility
> 
> There may be others.  Please run it through a spell checker.

Ack, I'll send a v2 fixing this. I've run the patch through hunspell and this
was the only spelling issue it found.

Regards,

Hans


> 
>> +the "kbd_zoned_backlight-<zone_name>" function naming scheme.
>> +
>> +While the smaller zones should use the new zoned naming scheme. Such a setup
>> +would result in e.g.:
>> +
>> +<devicename>:<color>:kbd_backlight
>> +<devicename>:<color>:kbd_zoned_backlight-wasd
>> +
>> +"kbd_zoned_backlight-<zone_name>" aware userspace should be aware of this
>> +exception and check for a main zone with a "kbd_backlight" function-name.
>> +
>> +
>>  Brightness setting API
>>  ======================
>>  
>> -- 
>> 2.53.0
>>
> 


