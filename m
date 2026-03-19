Return-Path: <linux-leds+bounces-7395-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XGYxHoTwu2nkqQIAu9opvQ
	(envelope-from <linux-leds+bounces-7395-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:48:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 812292CB54D
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93B913007B2A
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C2C3BE15D;
	Thu, 19 Mar 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYYIAucB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3BC361DD3
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924478; cv=none; b=F7y2yURRf1bIKM8t8Z79Z0S8jvXkqMSjlJdGd+t5DpBhROZBhURaF1NvXuifUASaQWMrfdbSRbNOh03PectBECXLfTNn+l+ot7Rgmo+opCkmVrQsE1rt1p/CCFJ7Gl/XImLMa7fWZawg10ofipUBNq8rwitjANd80XB38CtWAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924478; c=relaxed/simple;
	bh=zTY+Se3NFvHBXt3d4ew0w2jM2I7U1Cal8UaC8rHErGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhAwUuItwMK5ll+D9KqNiwZ2535jheNSgURP9twUbJZrXXED/lc7MTCzohWgEHKWrR0NQ81AgXiF2RR5aChEE6A4KU8F840SAAXE2vrYItz6RMn+ELg2tQs6oful/WnSotjYia6j75t2hRJp0TJE6ANrnxf5qkJhRZ/Iw7ofhxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYYIAucB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84551C2BCB2
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924478;
	bh=zTY+Se3NFvHBXt3d4ew0w2jM2I7U1Cal8UaC8rHErGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KYYIAucB7njxEo1PVsQFHRNpjRT84zx60wmJ2jyXxdzr2HwVkU3Puy51MsdOdplbq
	 FjQKHbJq53lwP5/rQPLvhBfDpf/00XGy6KchM3kbsQC4tNKPV5Eb6aNnAcRXoESGFA
	 lQbN2yILFPG3pCPLfzh6UubKjDpiuJOsx9aw6ozdYAM26auPhx3jr4KDCXAN8H9KaI
	 iHRv41pwjGEmZMAf8U766RUvXfmMPhpa1qiXKOgMVwHA5UcCS9ZUYZjWfzOPrka0rh
	 bOexCLacfoVsdVfkBHu6DXVxEgIAPjlgDxFfCIjVLgVMOmxiqf5cHwntA0mzkBw6YU
	 xwh1+63zZsDcA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64acd19e1dfso840915d50.0
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 05:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZJEzyy0iG2uy9oSh9ybgz52exhxr0sce6ca4BmEIkQcHs87gEcdgWYmikFDnJFwq3Cicf2LtIUQhu@vger.kernel.org
X-Gm-Message-State: AOJu0YzIl2nt3PxL4fIwM6Bh6ZRMqFCArrBOXSBBc9ptkzpUiHr6Q6HV
	8dei4roYcj48Pt4ry2r8hBQBv5Dg7LsZ2NRxZ7HYJ0JP+/4PZaMsrBIAwHj4ZjxBgfn+l+YP1F5
	wu2v0vAOv+YJO6tMlSoCh6upCdVz9oOY=
X-Received: by 2002:a05:690c:6610:b0:798:5951:f42b with SMTP id
 00721157ae682-79a71c40194mr76142387b3.42.1773924477855; Thu, 19 Mar 2026
 05:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com> <20260318-expressatt_camera_flash-v2-2-5c2b9a623dcb@gmail.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-2-5c2b9a623dcb@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:47:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmyYkxWmed+_TR90bQjOm80qOiFhy+ozO+oaStTCZgC6w@mail.gmail.com>
X-Gm-Features: AaiRm505cPvbdwiTvmw3UtKWuDl2DXwZ-y3i9XjbmrEhtSPFBdQzKgyQpyb6AMc
Message-ID: <CAD++jLmyYkxWmed+_TR90bQjOm80qOiFhy+ozO+oaStTCZgC6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
To: guptarud@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7395-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 812292CB54D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rudraksha,

this is a clear improvement! I like the directions this
is going.

Mark Brown needs to look at how you're using regulators
here.

On Wed, Mar 18, 2026 at 7:34=E2=80=AFPM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
>
> Extend the RT8515 driver to support flash ICs that use only a single
> GPIO for both flash and torch modes (no separate ENT pin), with an
> optional vin regulator that gates power to the flash IC.
>
> When vin-supply is provided, the driver enables the regulator before
> activating the LED and disables it when turning off.
>
> Make ent-gpios optional and validate at probe time that exactly one of
> ent-gpios or vin-supply is provided. When ent-gpios is absent, the
> driver uses enf-gpios for both flash and torch brightness control.
>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

(...)

>         struct regulator *reg;
> +       bool reg_enabled;

I think you can actually ask a regulator if it is enabled already,
regulator_is_enabled().

Also as long as you enable and disable it the same number of
times it also contains an internal reference count, so this is
often enough.

> +       if (rt->reg && rt->reg_enabled) {
> +               regulator_disable(rt->reg);
> +               rt->reg_enabled =3D false;
> +       }

I don't think you need to NULL-check rt-reg but not sure.

Can you use regulator_is_enabled() instead of the bool local?

> +               /* Enable the vin regulator if needed */
> +               if (rt->reg && !rt->reg_enabled) {

Dito

> +               /* Enable the vin regulator if needed */
> +               if (rt->reg && !rt->reg_enabled) {
> +                       ret =3D regulator_enable(rt->reg);

Dito

>         if (state) {
> +               /* Enable the vin regulator if needed */
> +               if (rt->reg && !rt->reg_enabled) {

Dito.

> +       /* Optional VIN supply (e.g. GPIO-controlled fixed regulator) */
> +       rt->reg =3D devm_regulator_get_optional(dev, "vin");
> +       if (IS_ERR(rt->reg)) {
> +               if (PTR_ERR(rt->reg) =3D=3D -ENODEV)
> +                       rt->reg =3D NULL;

I think the regulator callbacks are able to deal transparently
with "regulators" that are -ENODEV, can you just let it pass?
Anyway Mark knows what to do here.

> +       /* Exactly one of ENT or VIN must be provided */
> +       if (!rt->enable_torch =3D=3D !rt->reg)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "exactly one of ent-gpios or vin-sup=
ply is required\n");

Please drop this check.

I think there can be systems using the torch but also define
the regulator.

Yours,
Linus Walleij

