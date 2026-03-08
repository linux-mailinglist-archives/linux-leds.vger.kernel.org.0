Return-Path: <linux-leds+bounces-7156-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJcEBZQErmlq+wEAu9opvQ
	(envelope-from <linux-leds+bounces-7156-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:21:56 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B2232A80
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD66E3040A8B
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 23:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EBB35AC23;
	Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnpY8dvF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43556359A81
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012044; cv=none; b=eXvMLoAK2MyFRP/YRGNBO3t1lHX4lLOsB8PC9zo6eqKsZLeQD0fvfPgmpc7xCZ9C6VM3Z4sQUmZadrQRE7Tjz7/POBiY/bm+AHfWPWp8hSPAbMIupE9gwKRkK5maPgYqeVNAL6EzMWOwtkpDqbepHjKBTT57ZQmwnvFmDD3AgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012044; c=relaxed/simple;
	bh=tkXNNyhuUcisfjOD9LDo6nQcYG7Q7JLlx58CMzSrFYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKUzvX4Eazun8JQfAMX9XeY9lzVjxJkL7GrItn/TomOWFPu6DXx/GL9l7OfPdVyMWVRmDmxe0C9qJ0vHgshNf9hSd5vxfP9SgrF6LUK89nzC3QPevyZpPezp5OBjI2jwpguyGYVBMLjQgPCaj7tXfolz+qdtxMJZS0yAgoLuYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnpY8dvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F208CC4AF0B
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773012044;
	bh=tkXNNyhuUcisfjOD9LDo6nQcYG7Q7JLlx58CMzSrFYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bnpY8dvFS6YrL20tdH+1E3oIk+JmF4e6bPULhgEOPlc1SOvu4E0a5FoFQLDc6IUly
	 5gxKNvfPEAtFegLjFnMeXxYJTFTDGUpQKwpScoOc9J7QfutMnx1/obyhJ22m2hc2vE
	 0+gmXT3hSp59K6Mk4lPszJDEKWG259P9ggFIhZjS2Sx9+IZTG/z7zuK4mdTF1z87UF
	 oJ8elfhEw2UL7OPzH4Qo4o5m/wTpI/Gfh0spJfPLldO/ol8G5z5+3GjpToMvs4bBAa
	 cP+gonkvYSIikM/cs/kg7XiaQcY9FEoDN0PSoHX1Kfk78nZJq911VB8uHFzOU0/8nQ
	 c5d8oENHD5Etg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79801df3e42so141292287b3.0
        for <linux-leds@vger.kernel.org>; Sun, 08 Mar 2026 16:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbgGJpLJGOfM32IxohIJeIXb6xYMYC2Q7+Fb8bBo6UXJZ/zeUhStbbsqUP0bjum5D4QbFBbmtqlQB1@vger.kernel.org
X-Gm-Message-State: AOJu0YyN5xmsbXjZ6YN52Cvw57QPHqSA5qI1GZgChv8zEB5H2DPYQiXC
	WBh1Hf/KrYqZnZTWUifTBW5mLgZ8GM82ss4OXX938hsp+pkhKzetfi0CPgBtcy7GB4C+aX5FV2A
	rVVfy8t0+bxpOZumFV6fKbb/BFWTUoUg=
X-Received: by 2002:a05:690c:dd5:b0:794:c283:5fb8 with SMTP id
 00721157ae682-798d1eebf82mr109540947b3.25.1773012043250; Sun, 08 Mar 2026
 16:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com> <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:20:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
X-Gm-Features: AaiRm51X6o73CYP4cBk8SLAEUC5--fTx6OgmFz_CKYLt2xdlJPzNDoXUUO8RZ3E
Message-ID: <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B34B2232A80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7156-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Rudraksha,

thanks for your patch!

On Sat, Mar 7, 2026 at 1:58=E2=80=AFAM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

>    ent-gpios:
>      maxItems: 1
>      description: A connection to the 'ENT' (enable torch) pin.
> +      Optional for single-GPIO flash ICs where enf-gpios is used for
> +      both flash and torch modes.

Fair enough, that can be done.

> +  unlock-gpios:
> +    maxItems: 1
> +    description: Optional GPIO to unlock the flash LED circuit. Some
> +      boards use a PMIC MPP pin that must be driven high before the
> +      flash IC will respond to the enable GPIOs.

But this IC has no pin named "unlock". This is something else.

Given the way it works it looks like a regulator enable signal.

If you don't have any better idea about what this is, I would
suggest adding

vin-supply

to the RT8615 bindings instead and then use a GPIO regulator
in your device tree to provide the voltage to it from that GPIO.

Yours,
Linus Walleij

