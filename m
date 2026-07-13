Return-Path: <linux-leds+bounces-9058-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ka0aFpOjVGqGogMAu9opvQ
	(envelope-from <linux-leds+bounces-9058-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 10:36:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82917748C67
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 10:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.net header.s=s31663417 header.b="GD3q8gD/";
	dmarc=pass (policy=quarantine) header.from=gmx.net;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9058-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9058-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14B773018CC4
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134913ACA40;
	Mon, 13 Jul 2026 08:23:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444E5695;
	Mon, 13 Jul 2026 08:23:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930992; cv=none; b=IASGet7EQEa935JCPePQoWUQE2VVqoigEOoM3Z5xylUxgB6HWE7dGgudvgcy3O2qET3cTRW+T7qnWoSrwP4V3RTKIwUvbHFiI+WyQXiEwyIrjUjQfbe93qJRDXxLwIT+/00zERYilzLfceOd/JBo5OxRHmQ/ht7CYwoNmfpuqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930992; c=relaxed/simple;
	bh=0ro1Q6uKoaV1AqgVKQo/JBWntyyV4TUCd8+LqPrfzwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5OSe/CiNxD/a8f43o1Ty2fLWs+SbhIUM/iR7ilysOVpQ4V0ghPaLyVuKOwXFubhyJ3k6VKKDK35dSv/8GdnCJH1EkKrgBGoWkMfL0NiQCCQAxg18IjfSnaInL/zkjhjykzJ0+pBEie+X3X5pVa89XGCrkeThtXIrF51Z727Efs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=GD3q8gD/; arc=none smtp.client-ip=212.227.15.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1783930983; x=1784535783; i=wahrenst@gmx.net;
	bh=dEeMfNb7Cv9xmhJFzIpLa33FVfduvqtVRU1ZZEDXiaE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GD3q8gD/GQTDut6EXNx91CpBFEx2nuVQyDuYk/UzvWZEXcTZeLz3rg+kUGTvkOej
	 sRMt20o6BIXmx0WB3X5QXk35ugOgAr6oWz0qhVI9MLNOpJy1jN1F9eGDf73vq0XQZ
	 2LtUe3w0RbsixVUk1hu4uwXnr3cGlJQSQ/73nqX6p3FqsEOzPzGiuMfjSZv6wsCOg
	 MkbF2Gf7k1bD3/i03ZFGwFADrfek/WCK+ZpeXir5dxftolzaQURNFLyLLRHVErZX1
	 TgLaubc0UurdTuj/sBl78Q+ouGZDe2GOcj1K6jYzJGokzmTHVZ00hfneExfOHyZi5
	 Y+MGovQ28A7Ec6/lKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1xL0rk3xJS-00o2DZ; Mon, 13
 Jul 2026 10:23:03 +0200
Message-ID: <cacecf1f-3074-4768-825b-bf143fd36ce2@gmx.net>
Date: Mon, 13 Jul 2026 10:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: leds-group-multicolor: Introduce
 default-intensity
To: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Rebmann <jre@pengutronix.de>
References: <20260708224652.106632-1-wahrenst@gmx.net>
 <20260708224652.106632-2-wahrenst@gmx.net>
 <20260709-outsell-undamaged-6c8045d6115f@spud>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260709-outsell-undamaged-6c8045d6115f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G8p4x0y6KRHcJ/DOBqhSoHCP9ZkodN5A2Ytcv7RBM/1P8Dd1V38
 84TNF4oH2UmvAZBlW2R+AsmXbK9CU6zh9H2gClt/Vgi7T1K94Xqsu8iO4+5S3+hAiM9eX7o
 FVwcWBXeL/qTi5ABODlT3sevpsjc2dHw169kKLl1wqAoiYlRPeywU52X9Wh0wV9XNo4goLV
 Iz77I0Ftl47EiLgKi2cmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ju/Sk2E5WKo=;xYLlzcn7AdcyHFHBcOH41yKNogo
 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
 =
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9058-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jjhiblot@traphandler.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:jre@pengutronix.de,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.net:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmx.net];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82917748C67

Hi all,

Am 09.07.26 um 20:03 schrieb Conor Dooley:
> On Thu, Jul 09, 2026 at 12:46:51AM +0200, Stefan Wahren wrote:
>> Currently it's not possible to specify the initial color of a LED group
>> during boot. So introduce a new property similar to default-brightness,
>> which specifies the intensity of each LED in the group.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../devicetree/bindings/leds/leds-group-multicolor.yaml    | 7 ++++++=
+
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicol=
or.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yam=
l
>> index 5c9cfa39396b..18b722b807ba 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
>> @@ -19,6 +19,12 @@ properties:
>>  =20
>>     leds: true
>>  =20
>> +  default-intensity:
>> +    description:
>> +      Intensity to be set for each individual LED. Used only during
>> +      initialization. If the property is not set then max intensity is=
 used.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> Hmm, there's already a property proposed and applied for this:
> https://lore.kernel.org/linux-leds/20260605-multicolor-default-v2-1-ed07=
271df6b0@pengutronix.de/
sorry, I missed this. Thanks for pointing to this patch. In general i'm=20
fine with this approach, but there is something which confuses me.
Looking at the description, there is the statement: [default-intensity]=20
"Defaults to 0".
This seems to be correct for the Linux implementation of=20
leds-pwm-multicolor, but is this really an expectation along all (multi=20
color) LEDs (at least for Linux)?

E.g. leds-group-multicolor init the intensity with the maximum. So all=20
users of leds-group-multicolor should specify default-intensity for each=
=20
sub LED to achieve a defined behavior without breaking existing behavior.

Best regards

> It only supports a single value, I suspect you'll have to rework this so
> as not to conflict with existing property?
> leds-group-multicolour imports the common leds properties after all.
> Probably the one in common.yaml needs to become an array?
>
>> +
>>   required:
>>     - leds
>>  =20
>> @@ -56,6 +62,7 @@ examples:
>>           color =3D <LED_COLOR_ID_RGB>;
>>           function =3D LED_FUNCTION_INDICATOR;
>>           leds =3D <&led0>, <&led1>, <&led2>;
>> +        default-intensity =3D <1 0 0>;
>>       };
>>  =20
>>   ...
>> --=20
>> 2.43.0
>>


