Return-Path: <linux-leds+bounces-3840-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998FA191AC
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jan 2025 13:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9B61882F3D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jan 2025 12:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403D9212B1B;
	Wed, 22 Jan 2025 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cfg3LGES"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869B1F708D
	for <linux-leds@vger.kernel.org>; Wed, 22 Jan 2025 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550001; cv=none; b=uJQ+p5eOYblzP1Wx/jm1f9q1YtxlziguzDLb1Mptg/6C8HKyl1jsfWDsWd+6rcNc2UEThdp7DhaNGgRWuv1nPM3S+9IHLmkzrGggmVASvPX4xIsuBioh7ePF03e00GpJd0A/da+Hg0Rze6GNiCtmNiAh7YmLPm10Ioep/rTLTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550001; c=relaxed/simple;
	bh=/l5whfi/TU9X0sa+oH+QdXFEULZ2Ua5U0SDwwNs4V3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjMWfxpA4YvZBbT4m21/mSFjyYJKjnkGzgjHt0iEXUAZgk87ClTq0UnQfWfYs4ti4ZX6Q8JWB52matjwYlxfRbO9nc0QjKHzKzKM7PoagxNkp7A306Mg35SFiBpcUkWecInH6a3xWAzBSbqPssQVlx3jiPF53eoEkn7ba8Jc6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cfg3LGES; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f757134cdso7054941e87.2
        for <linux-leds@vger.kernel.org>; Wed, 22 Jan 2025 04:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737549997; x=1738154797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l5whfi/TU9X0sa+oH+QdXFEULZ2Ua5U0SDwwNs4V3g=;
        b=Cfg3LGEShUc3rw8cU4nv+DvNMmoW5z7SAcCp3MY/fEU1BGOlbXk/VoO2YHM2G3hIB8
         aWCJBFZ0gS72aiuEXU5a+jEXjcPEAJ/eV4ce5dXs/X9l7wpGPrIK46En1nDVBDDkxQnI
         wxcPtN6s5+nrfX4v9XBBI6bYGQsedA84rcnGBOO4vsI2YzyO3RlLrKbt9qULacZnKNy7
         g3koae2j/UobVWdD+w9HD6Uk/rQZe40JfwuQJhRDOrKTelkCm9K/TZTH8fwlrBGc5w/6
         o9zf4NWT+Sq1gZ8kS3p//E9rENeTQMn1TTAbi7cDa41ONBbGjF0ts46gPUY8lSDXPz4B
         I4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737549997; x=1738154797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/l5whfi/TU9X0sa+oH+QdXFEULZ2Ua5U0SDwwNs4V3g=;
        b=JDEn+j5hd7SYRZLEhQghglv0ZxuFj98mbnyDhJFnBzNHAO2QpYTlJGd2xmmfBk/9vu
         XTA1PjYPHEVouvtCORpcyhU541eqGLjmTyc2eA8YEz1Kj/611to3XtiJI9TyXuec9LVA
         UlA8VLEgtvdNSbV/Qj8p4DFCY3RqAeXqD2zijfiia97SmJnHRcNdEJg98VM1REBYROYx
         90rRDCDh/v7ILC1QbxdSibE5QMaDQ/psXnkvU09iat33tNeDSJzO0mRHkDd7AHTLaI+z
         7GR3vxD9FxAncKWtl44W6Wu4hFIPOgvyiZZ9Q4ybSltxIDwBWnfbOstDCf4R1Fs/O615
         RHWw==
X-Forwarded-Encrypted: i=1; AJvYcCXIAcb08+G6JLzOWWTl06prIejyTyNcZLVphYimSC0OM2UKZ3OOuozIYvOTa4hikoibUm1lcHRd+9Dy@vger.kernel.org
X-Gm-Message-State: AOJu0YyfyJk0piZjyQLPXye/7DCUgwH5jDLsnWYKe7SJUoVfOdB2Pm3r
	JnoRSL8DsuQrzfp3glY5lv8gVfIm0eKQ/tnr41opxAv8gPyWl+YOfyYOxBUm0VnVCqg8Z3FZMPI
	qKLXYWZ6vGHxr+1xSLn4Z8zdIw+fqBGsHUUud1w==
X-Gm-Gg: ASbGncsTXEuKwQISCpKkIQdyciCfU/hgYREsRD1JuGufqQWW75jfiVRrqZ6jZVNZabO
	WSzSWLCFtSfMqWeUXNGgR+tMqaao1OiLhCDYCrXqWQFwJ/3xg3Q==
X-Google-Smtp-Source: AGHT+IGjgBjlUgcB69dmTOIvKwbj+e3IlkuTbyMESMsoE1KC978GwGKsLt3VXVNdUncN8HG6HGcGVIwgM9KDeYaU3+Y=
X-Received: by 2002:a05:6512:32c7:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-5439c265ce7mr7014426e87.35.1737549997295; Wed, 22 Jan 2025
 04:46:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
 <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com> <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com> <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
 <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com> <Z4jNZPcDd89-HfAd@smile.fi.intel.com>
 <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
In-Reply-To: <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jan 2025 13:46:26 +0100
X-Gm-Features: AbW1kva2F4OTmtr3bQVZTVKt9Nl064Bf0-XTMMAcP_pBnbx-PDZEjOCq98BucjQ
Message-ID: <CACRpkdapanuq=_f6xKFGdVnksEe=3EWY=AxDORwVKacv68nYOQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 1:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> For the pinconf / pinmux, the FPGA is just a voltage translator. It is
> transparent. The only relevant thing for the FPGA is the direction to
> set for the switch of each pin. And the drivers knows which directions
> to apply during the probe. This direction will only change in GPIO mode,
> but in GPIO mode we know which direction to set.

Just a thought:

Maybe the lowest impact is to just patch in the extra operations
directly in the existing Intel pin control/GPIO driver in
drivers/pinctrl/intel?

I don't know how this is detected by the system (I guess some
ACPI magic since it's Intel, in DT we can detect the top-level
board) but it can certainly be done and
probably replaced with compiled-out stubs if not used.

This might not be what Andy desires though, I think he has
the final word on how this should be engineered.

Yours,
Linus Walleij

