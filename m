Return-Path: <linux-leds+bounces-7157-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEnHLCAFrmlq+wEAu9opvQ
	(envelope-from <linux-leds+bounces-7157-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:24:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642F232ABE
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777383009521
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 23:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0298350D7D;
	Sun,  8 Mar 2026 23:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5r8Z1wm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD852D8DC3
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012253; cv=none; b=EHNWpDNieHGpI5Iy0QNFEkKNkSrfXQQZ/3S+WzDMqqHiWIe/nv10AuVrh+Muzk62DCVAJrtFPLfJyKrlF8sqf02zbYKvwQRmrgQon0kOnEA+vs32M5kTps+6W5J7v/RID4IZuURsVgnzjWN+ImMsW0UN9NTt+6a7BE794cqC0kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012253; c=relaxed/simple;
	bh=PhJInxAne2cgG+yXl9U7mxd7b1rvcJj5x9vJEDoCccQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NP2+Cycoh1iu50AwVylonzWV0eFc1AUhh0P8kjl3ofda35aWszxs9hNip291gV/HOkscnkh/PI7zA78SgqdCLdzq9ScYJMNPNwkaoeKn+Kdje9AV6jsnmj4zZzktUiaunwmM+l27ORYVfMDlX2/pALk6mbCmd/ADTSPFUoyIWJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5r8Z1wm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52038C4AF0B
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773012253;
	bh=PhJInxAne2cgG+yXl9U7mxd7b1rvcJj5x9vJEDoCccQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5r8Z1wm4T/aw7h14Bac3nh1J3nKYmyfMDqrKFlOGpVU8eg390GIjRUOdzKltufv9
	 lYHCti/q9F7GFFRLzlf3x1plxJfnFBkIWj33TzHpveUa3iXwAxWejWF6S/NEsQjVVE
	 1MQEqi3N4F1jM5Z0eGAWqK62qJsw8Hu2hcaUUFmhTpSinM1ugDJ9Ac3i/pFZ+DAG6Z
	 shbmMSpW1JnY01K6blR7rLPXRpmfVnivzMHGZRGGsIdscljiN38Pz3jRicSZLD4ypw
	 W7FjbFeXIXQP0PC4XCQm7DlD3KKlcZBddXIBMZsMkuM35ay/xAdTl1ETddelLKnyUH
	 8HZMn7VXGBqCA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7986fb839f5so95360847b3.0
        for <linux-leds@vger.kernel.org>; Sun, 08 Mar 2026 16:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBCpXbkwY9U2P1I5S37ElRt+MFkQBix4yZiP+lRorMtHhHMJ9xyTnvJmqB+KL/ZwsDD9Ygiqm/aVRD@vger.kernel.org
X-Gm-Message-State: AOJu0Yziq1TXsVWM/edZpxuF5WsM5F9T//BGsZyckkj+9nsx8NvO8CzC
	KD7vU3X6UEbTvQclyNfUeEvMjEwG/jJ674Bf4ytAXux/sp7CSeREGvZYfO3pR987ZtSR5LR/rae
	PUwDhg2wwhX7FS8sDBRCLM79ahveF3Y0=
X-Received: by 2002:a05:690c:c501:b0:798:6619:f1d3 with SMTP id
 00721157ae682-798dd6786f8mr94677137b3.4.1773012252633; Sun, 08 Mar 2026
 16:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com> <20260306-expressatt_camera_flash-v1-2-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-2-b1996f7cdfdd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:24:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=t5_3TgCQuVQ6-5yp6_Go2vgZhkdr26+nnkQnOFzOu0g@mail.gmail.com>
X-Gm-Features: AaiRm52Byo4PRf8WKpoUZBEylbBavWF0OKVPG6e6WT9AB701ecZZflOqWtuIgbQ
Message-ID: <CAD++jL=t5_3TgCQuVQ6-5yp6_Go2vgZhkdr26+nnkQnOFzOu0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with unlock gate
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1642F232ABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7157-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Rudraksha,

thanks for your patch!

Overall this looks fine but:

On Sat, Mar 7, 2026 at 1:58=E2=80=AFAM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

>         struct regulator *reg;

struct rt8515 actually has an unused regulator struct
that was never implemented, but should represent the
vin signal.

>         struct gpio_desc *enable_torch;
>         struct gpio_desc *enable_flash;
> +       struct gpio_desc *unlock_gpio;

Skip this unless you can explain how it works, use the
*reg from vin instead. I think this is just a GPIO-controlled
regulator.

> +       if (rt->unlock_gpio)
> +               gpiod_set_value_cansleep(rt->unlock_gpio, 0);

Add code to disable the vin regulator instead.

> +               /* Unlock the flash circuit if needed */
> +               if (rt->unlock_gpio)
> +                       gpiod_set_value_cansleep(rt->unlock_gpio, 1);

Add code to enable and stablize the vin regulator instead.

>         if (state) {
> +               /* Unlock the flash circuit if needed */
> +               if (rt->unlock_gpio)
> +                       gpiod_set_value_cansleep(rt->unlock_gpio, 1);

Add code to enable and stablize the vin regulator instead.

Yours,
Linus Walleij

