Return-Path: <linux-leds+bounces-5780-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A96BD97C9
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 14:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D23B3E2C44
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 12:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A752313E0D;
	Tue, 14 Oct 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD+nY9Ki"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA831353C
	for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446726; cv=none; b=YXarSdtP3VvoO15K1DouXHypwFPWSWEX+EwsUoUsL4MBliq/Osyow4fxuHruQWpWucQ6SjM9RLORB3ZiFQSs5cL7sWBVl068QPsBejn1WBJ27twJ+0MUKTv6dj34GK5xyaqmv9/y8qhEGLTVLljpNHCmnuxxEp4uWJwicMqoKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446726; c=relaxed/simple;
	bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MenBvHJ5egod0jwoWBrNmUdHN/pLKarATQ5eNo5ImT5C8WdzrTT0+pmYukdgiacD0kDj6OgGNZTvWcD8M745lxHYW80ktQpJteLPCY78OJj5qTkZnCUFoOpP8lG5JHiTx9RmYj+A4bEVseUmypRdUNWCWEs6+3pS7PqUdX8moW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD+nY9Ki; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63cf0638c1dso3763960d50.1
        for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760446723; x=1761051523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
        b=HD+nY9Ki9ZCU+ZBbai3sK4TlP+Gj4PeD5IBvNbVgmRwrXEMP1rH1Kq7Wd2U4DC9ql2
         mmbSs/sedO+Z+pqNh178iwTUljJhUPXdoP+VQFu2ruyAZTpafom4Dgb3i9C7kLT30HMb
         nugdcECozBZLP8w6AumLU59dnaaYGy11Vk23pFabxvZWzNmDF8nOoZlM5WedT3ES7DKS
         D/cB7mXIddWy/q7Wje43ITkR6khfIHEjDiCwmec977cTp60w5mWUdbX6XXjhJUkrWeWO
         j4ESkWjq0mWBEgaoWoQnKZzyhE+qXTM8zA+qwVIdhoT3qqyvhnb1qjF3AFb5czRRY0iT
         BJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446723; x=1761051523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
        b=OkTtJ92P5N66CCjwpDcXB/W4+XF1p8vDjSOnXA4lWW7WTbxJ385CRVdmQaPTsLrST3
         4MdtLmT8uC7lzlwvHQERDd7toTmlINrBkFp9kTdH1OzFWimdxH86WsS9BARFAPw5iS2w
         CD/dLvxGPQbUsdiLLDTV68z9p9gSgk1r05SYZtwlc2z96Da5hhHhfeEsxdDogypJKMlJ
         W27NkvwuCzgBegRw2w9hOu47qpAXrRtZ1FRV+c6vwwOwW8r7PkJ2EkutNfqAvFAMQ4uF
         lg7G0v9hJiFM1acdlx1rb6xRS00GZ9ZBuVNeQojmsHXTTDbg/YiRR/4svopad8X6Hi/X
         Owmg==
X-Forwarded-Encrypted: i=1; AJvYcCWphcFTqHSZTPmuUPFkr+rCbxkY6SjfEHC8UzoMFGwYB1aucD2eik689LnRcRwgv9EWgyarSdPuY5Bh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeur0qg1be+eitrznUTuvcAknw4QkFEeWEF/YF8NL+L8SswoW8
	XFVsDTAtJz0EjJQ7goTfmO5fvT7Og/0pKGlLirCwLvOg90v3+JO92ODt5psQlZPQLNUgMuBRn/b
	MhxB4Z4g0zjdhcLuXS51n+k1ihz6gGrcOo4m3H6AQuA==
X-Gm-Gg: ASbGnctUERGcqo+GnYmmBCsUvqyGSJVfECRR7QPvQMehShTaXoEmfrez2qIja4WejTq
	7opWwssN7EQYQgIOnix6LC5OI8TaF4LKIbkAhpusVmzRD8qGnmVXkj0iJq7VaRL9LsAYuPK7uv2
	l/c6BNSNALmd5CjaDNY31xkwoyxTq3plggGF0TSzHlucRPJgDikrGQiz4M8V7hqQnQbtsgU4xl2
	vu7NKWppYKZIbYMOl8SwsByMVeZUQ==
X-Google-Smtp-Source: AGHT+IG7Kofwx6n9tYMDxUa5Z04wJalhfP6YJEHLa4yTiQQEa2UVqFp3ownpK3FKUhmGBn3Yg5tzw6HGtBhEHg9/vxk=
X-Received: by 2002:a53:ba8d:0:b0:63d:24f9:5332 with SMTP id
 956f58d0204a3-63d24f953d8mr775113d50.55.1760446723523; Tue, 14 Oct 2025
 05:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
 <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com> <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
In-Reply-To: <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:58:28 +0200
X-Gm-Features: AS18NWAzYGkVtZF2eWYQ8i62TI7iWUixyj6KHyQnG8bjFDuI6exLbunxibrSSZs
Message-ID: <CACRpkdbOKNPFxNJM-r+HdnfKYisWJrQXvG21EL9w4UQVP74D5A@mail.gmail.com>
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 2:11=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> > These are a bit idiomatic, not using the actual framework for such
> > things (pin control) BUT: they are on the other hand crystal
> > clear for an integrator working with this device tree, and only
> > four pins so why over-engineer it. I am fine
> > with them if the DT people are.
>
> I kind of like to emphasize the fact that this is not really a pin-mux
> in a traditional sense. We can't change the routing after OTP is
> written. As such, it more resembles "wiring" of the signal inside the
> PMIC, and this property is not a control but tells us how the signal is
> wired. But yeah, let's see what others think of it.

Just that the muxing is controlled by OTP and not by runtime
software doesn't make it not pinmux. It is, because it is
(one time) PROGRAMMED to a certain purpose. In a factory,
nevertheless.

But the pin control muxing subsystem is designed for muxing
that is controlled by software at runtime, and as such, indeed
not a good fit.

Let's go with this!

Yours,
Linus Walleij

