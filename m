Return-Path: <linux-leds+bounces-6935-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id olJbH45ljWlK2AAAu9opvQ
	(envelope-from <linux-leds+bounces-6935-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 06:30:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E212A6BE
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 06:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 950353040FAE
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 05:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6103E284674;
	Thu, 12 Feb 2026 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw1r337u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A051FDE39
	for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2026 05:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770874251; cv=none; b=gpQVO3pjf8OAK5uY9kY6PCzRhGhU9Fz/cz4wqVVn4V4NmuZ8ESabQyRYolyDfwjk96wjU+kR7IN4ZQgEMM2KrSWPIDj9EpYTy6mN9yljU3fyUFoy9/z78TdJ7AR/ogzxnwoo8PnQl0+AFseL89Y1TXETxr3GQd6uOKkkXv5pcfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770874251; c=relaxed/simple;
	bh=M9u3F8vMbb8KnjCzF8afvRTHFhneUQC2iutBlxhIGw8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ayHKSOEbEMClnUuS0vZ652gx8KK+3ZTUXL9mSG3IE3ENfcjkiwizQCRN63GQ9z2KN4TWcavR7CY6hCkd7RnUTLUzzPKk4khdW65ChalfmVr24kKjHRNXAEJBziDMrXOcQIsavRjQrzhLgyClKfdrudlHFI4pkQfh9aYWtRgdwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw1r337u; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8876d1a39bso858151166b.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Feb 2026 21:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770874248; x=1771479048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aiP8Erv5C7Xj3JXt8nFdVUGp5E+liP8wGy23CnOFomo=;
        b=Fw1r337udEW91F8u+YRGcxg44DHKZEh9G7IyyPaa/BqFhGrU13/FCcjbqwBatHYUfl
         OiDRT6iSKincNmWBYwN0orurS49sPxcfRSF7iKQs0R91B23OoSOCdul49BSIBvhs2NJk
         YA+aHD+IHQRe+q7jUscSiquMH9dVFp8ZIRB45+aRtUiEJtaGIhhDskd8NOqCZDdO/VPB
         51q/uu1VgDzIZH89M0OjoCxN8ZPyAUCdGhHv3IfPB8gklPH5R2c4u/V4Vo3qWydcoQ9d
         BueNeIFYeF/rcu7usGZok0u1SbCz89+bxPWY6WBNSLGDKsOCxg7XjDXciEGFWHCYwtgR
         3jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770874248; x=1771479048;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiP8Erv5C7Xj3JXt8nFdVUGp5E+liP8wGy23CnOFomo=;
        b=iPXrTDQyQ32QYfxSI4ixahrbFn31CqgIQ9BiAcWph8XNTPRqVf9nuUTFivRtRPubLI
         MQE6g2764aGUcWhObxrmcPI6qPYxvR2ELmesLE4PXVv/aNuMqOmITFJ98C5AjxZAlm3B
         35Xy9PpmvIH4UxGjd3vIxacZS/bJVHcHH3EAq0f9Fs2jQ/iNZ5Z29JfIwgYDVGrNuPPU
         JumD8i6t0/L9ARI7/WXsXztCHQoiSkXDZpZyoVSruizEB9noeYGmGNn3NWjnFY86q2ns
         Hyn3ZEeOJn+ugkBmkEquq7SoBhIFdfUfDS5ZdTLvaovB5rGib6imUNpq/RBSNK4SAe/c
         Cx1A==
X-Forwarded-Encrypted: i=1; AJvYcCUp2z68iR6oK/XA91d6MiUPOOecGM7kCfLK3l8Sg/5GBgqKssDXEmB3omZQNpJIv7dqwSlvWLIOO1r4@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsxxWRersblCqVQHrJU7W1PfsIGtjW9NFi826vHhyHTYf1dG5
	thRmGXAyyjFhzak12Y2uRkYFRY6TwRF3VXi9KEZrMFjxcfrTJ7eQH4yz
X-Gm-Gg: AZuq6aJpE3h6kS2uwTIEDpaqWAVKtg/2t5PuimxdvynkljX/2ZbuoM/I7VN72pIVJip
	Ivl/AajyIiJkiu2DQbsPnpRw25rm+t03klS3gS+ipIRl6N2uc6d2js77giYZXi5/dTH1nIqD83s
	6CTXfEZHzoizq0tiusdxxzJWaIr4VtrCeO4SWC2RbL2rg9VRdEVMMfz9blwBxZUUX7QwLhXtfdK
	G2ScyINwtYSyzcVBbIZ385CFXxqIDbhWgf3YsI/qXNUUzP4IBxQr49Wy/oxODueDTjjN1aqwYXO
	iW+YC5J+aqWzKVKdMVPAvv5eHjyHOWirKMIziKK/8zCadOVCkB2DS9n2R60rhcGGi07wVbqK7qn
	0wijXxwwFZOnNIAeznN82RMn7dmgdmLNBa5nJ/oCgvA4h3buLSGU3/sOMGOef3Y5UjbR+FSnE1g
	/LUWqG/Md7yupxHcu4fnirw4Xf3QYjVFxS
X-Received: by 2002:a17:906:eec6:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b8f8f842106mr82989966b.54.1770874247809;
        Wed, 11 Feb 2026 21:30:47 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.248.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9d0212sm129363366b.26.2026.02.11.21.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 21:30:47 -0800 (PST)
Date: Thu, 12 Feb 2026 07:30:45 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dixit Parmar <dixitparmar19@gmail.com>,
 Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_08/11=5D_dt-bindings=3A_mfd?=
 =?US-ASCII?Q?=3A_motorola-cpcap=3A_convert_to_DT_schema?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260211212016.GA3910589-robh@kernel.org>
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-9-clamor95@gmail.com> <20260211212016.GA3910589-robh@kernel.org>
Message-ID: <E5BC797C-4362-4C75-BCAC-7C32A51C4725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6935-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E56E212A6BE
X-Rspamd-Action: no action



11 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 23:20:16 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:28:42PM +0200, Svyatoslav Ryhel wrote:
>> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML=
=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/mfd/motorola,cpcap=2Eyaml          | 411 ++++++++++=
++++++++
>>  =2E=2E=2E/bindings/mfd/motorola-cpcap=2Etxt           |  78 ----
>>  2 files changed, 411 insertions(+), 78 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpca=
p=2Eyaml
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpca=
p=2Etxt
>>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap=2Eyam=
l b/Documentation/devicetree/bindings/mfd/motorola,cpcap=2Eyaml
>> new file mode 100644
>> index 000000000000=2E=2E7e350721d9f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap=2Eyaml
>> @@ -0,0 +1,411 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0 OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/mfd/motorola,cpcap=2Eyaml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Motorola CPCAP PMIC MFD
>> +
>> +maintainers:
>> +  - Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-peripheral-props=2Eyaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - motorola,cpcap
>> +      - st,6556002
>
>This does not match the only user in the kernel =2Edts files as=20
>"st,6556002" should be a fallback=2E
>

Honestly, I would remove st,6556002 since it is not the only cpcap model w=
hich can be used, hence it cannot serve as a universal fallback=2E Some dev=
ices use ST produced cpcap chips, others use TI and range of models varies =
too=2E I guess I have to multiply commits=20

>Rob

