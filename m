Return-Path: <linux-leds+bounces-5325-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3991B389A9
	for <lists+linux-leds@lfdr.de>; Wed, 27 Aug 2025 20:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F64D20691D
	for <lists+linux-leds@lfdr.de>; Wed, 27 Aug 2025 18:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CC12DAFA1;
	Wed, 27 Aug 2025 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZbRsvJ3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD52D0C8E;
	Wed, 27 Aug 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756319870; cv=none; b=cote04lv9GXZo0qXz2tTl/wn6OhRshARDaYIw/uGwX1hHQqYeu2/wLZkk2umT65boA+RY7+E4KwxVjhJXrln4R9yRH4hGWYqhJtGoEfzgkbXv566cj8/oPQnohpVz70H70z/wTsCQQKFq6l88A+Lj/XMf4ZYJmKxfLVSZTbn6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756319870; c=relaxed/simple;
	bh=Dgyo9jnBv6LNPAfhmB7gUANFGSsvItKk64D2K8UqYw8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bjD5iNhKJyefdu0kJAqYujILEXZD6aWlheuVk6YuDcpOe25DRmqyOOuez9fxAZI40gYysOdpCLX8iBIqzG/G7QbcBg4u/qQ0VJvuDOECpzFztwFEbeXje7TzMAUhVdpRiPq7hewWfX8qbqOixYbRDIu+j7NC0y9nX8RxjTZkAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZbRsvJ3; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70d93f57924so2690226d6.1;
        Wed, 27 Aug 2025 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756319867; x=1756924667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LVBcUb/bHJFMiTHopCcUP9iDdDKQLUoZGxIkIepcKA0=;
        b=IZbRsvJ3a/535L5KEvfUsT3RDbBjMotpGEXtGitG+kZQQt2PdYEF8JugtN7KhjXLhE
         le/EzXuOmt+B9A75FYxB6rhW3MZV/LykQROEIUrD617CcfuyguLF/XmoPvIhss4kbxNr
         OCku6T9FD2oD0RuZ069YAiAiorm7l/ebQeX3j5j6Qqu44EPuYr+7SA6QAq9IVtiiv5o2
         WmxdeFs94ZxSrNdWRyOuJW1NOgaMZ00/RGm/IFkRQeyEdMH+jHIGPwjacaTKBxyOf/d6
         Bnsg9atfVM6D8zaRUZBIuyhoi0IfhfahB24akoM90ymEtlohAjlknrGTEBALPxB59vAg
         Md/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756319867; x=1756924667;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVBcUb/bHJFMiTHopCcUP9iDdDKQLUoZGxIkIepcKA0=;
        b=ChNuVzDuOo+aRHDTik2DOEilhb+wIvX477zDEhA81jzx7HIOuSe2AK3cdqJfDGeVFK
         OQShCl6wiTPJnTI6JG30pDXBaipSf+mMbROspTl8H29lkN8LK9q54i6mBefzxvgya0E4
         GnIEoYUSDeVmgOQSi52T269WENQvBSOvuIF+0dEoFfh2To4bqyRtQqvEUQFNTZ0wLIiG
         D/CgZAmFRWFecRJwUrNsaTOWVlhFaGP1ibG6OAj2dn5Z7dSfzHLp42K8HxWdydRKgSpi
         GybH5Ki864GBVq5eazMZDEOutyFHCiXx+Kcf5c4Rmd2zfMh8O54dKlsB/1exfoBS/T4i
         Tpxw==
X-Forwarded-Encrypted: i=1; AJvYcCVZwX0GxjegOu06ViGOcpw5XPwcIJOLeVFunwva5zayQJ5/nZfgEAF5BNnk9Xng+4cnNNcb1j7vOohq3X+/@vger.kernel.org, AJvYcCWdhtJI5Ec259FUj9asUGC2TU3yoLWBkAV7TwN9lPYbMa9xJCbZXAChF3MEBpttmA34SJnlmByuseRM@vger.kernel.org, AJvYcCXkus45fG0bdwCJieceOM2ueGbCgX4lE6JCVu2k0FDfAXG4hez5vgheDK47oMN+lpBV2LktA0lL+pk2Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXg4FgThGye/iFqa9dR1N75UW11nABi68hgEk2hN22GbiVZb3y
	IzFgzttfe+VvMdUXHMHuKSZvWlFECBj3rNYefuV5cRWKK+Py4IxW4I4K
X-Gm-Gg: ASbGncsRswr9gKAa6AfPQk35mdDpa4rkKJadYLqaVhuTOeL34zymQ9hBVOSKWmwHTrE
	pr6g1yuPaCoOTzLkOM51GaLtmtQ6ARDjLfFtKCXcav+jnOsP5c5vgvSpAsBX5s36EITpaLgt7pa
	q557lQhD3EKolqyy7wBUWsML984TlS65D0+2p2ukVeDzqq83YXSpOoB8w2jEmusg7UZc8KrN7wk
	Ol/6sWOjTrhlLUJaoylK82Clv+jZHWXyRgN9ME/2j/vq5qINKoEAmAeGF0aPa2FL86FfcAg73t9
	MLwhzaYBELAdeUoV5W5QrRygkn3/w0Vn3aWH8wDkF6jHacipwGC0eTlkqNq8wb8ILHvt0BXKQw8
	nJDWNQWbiuDMZeSC+6TzOzxMHYmPpgncmQOG69ndcB7yd9s0CXfDRRPTfI6eUQr11ZZTZXanlFo
	iH8UmeoA==
X-Google-Smtp-Source: AGHT+IGOouHSC8eeallBbBH0UyaNEd7KexBlIiSEeHRdTF08kGoqgqeD2xSM7bWB6BZLDOTWLh4aZg==
X-Received: by 2002:a05:6214:4113:b0:70d:aefc:359f with SMTP id 6a1803df08f44-70daefc3b2dmr165949486d6.48.1756319867032;
        Wed, 27 Aug 2025 11:37:47 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72b3c1csm90634976d6.58.2025.08.27.11.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 11:37:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:37:47 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/6=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-4-jefflessard3@gmail.com> <aKx9zQNppjNNMJEt@smile.fi.intel.com> <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
Message-ID: <49F7228C-0EE6-4202-A2AF-A023B4A4DE4B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 13 h 48 min 45 s HAE, "Jean-Fran=C3=A7ois Lessard" <je=
fflessard3@gmail=2Ecom> a =C3=A9crit=C2=A0:
>Le 25 ao=C3=BBt 2025 11 h 14 min 21 s HAE, Andy Shevchenko <andriy=2Eshev=
chenko@intel=2Ecom> a =C3=A9crit=C2=A0:
>>On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-Fran=C3=A7ois Lessard wro=
te:

=2E=2E=2E

>>> +		fwnode_for_each_child_node(digits_node, child)
>>> +			display->num_digits++;
>>
>>Don't we have a _count API for this?
>>
>
>I'll use device_get_child_node_count() instead of manual counting loops=
=2E
>
>>> +		dev_dbg(dev, "Number of digits: %u\n", display->num_digits);
>>> +
>>> +		if (display->num_digits) {
>>> +			display->digits =3D devm_kcalloc(dev, display->num_digits,
>>> +						       sizeof(*display->digits),
>>> +						       GFP_KERNEL);
>>> +			if (!display->digits) {
>>
>>> +				fwnode_handle_put(digits_node);
>>
>>Use RAII instead, we have defined __free() method for this=2E
>>
>>> +				return -ENOMEM;
>>> +			}
>>> +
>>> +			i =3D 0;
>>> +			fwnode_for_each_child_node(digits_node, child) {
>>
>>Ditto=2E Use _scoped variant=2E
>>
>
>Well received=2E
>

After further investigation, _scoped variant exists for
device_for_each_child_node_scoped() but not for fwnode_for_each_child_node=
()=2E

I suggest to include an additional patch in next submission to add to
include/linux/property=2Eh:

#define fwnode_for_each_child_node_scoped(fwnode, child)		\
	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
		fwnode_get_next_child_node(fwnode, NULL);		\
	     child; child =3D fwnode_get_next_child_node(fwnode, child))

#define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
	fwnode_for_each_child_node_scoped(fwnode, child)		\
		for_each_if(fwnode_name_eq(child, name))

#define fwnode_for_each_available_child_node_scoped(fwnode, child)	\
	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
		fwnode_get_next_available_child_node(fwnode, NULL);	\
	     child; child =3D fwnode_get_next_available_child_node(fwnode, child)=
)

=2E=2E=2E


