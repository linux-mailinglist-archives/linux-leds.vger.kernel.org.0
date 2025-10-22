Return-Path: <linux-leds+bounces-5853-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1FBFAA51
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 09:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C42F18932EC
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 07:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2132FBDFB;
	Wed, 22 Oct 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyNITR6I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6A2FB630
	for <linux-leds@vger.kernel.org>; Wed, 22 Oct 2025 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118982; cv=none; b=JDPFP07dIijIiHxqe7j9YsFCct/9y/spMYOg/9GgvbUhwOR+tlK71GdlRBwQLuMtdmQIJkYBZ0mnJhgyeo+bYLqqMn0qrj990uy0kQmeFnPVMmTFAF96iJtBAhpcyRpExMraY7CI0Y6LtRawkiSLnB3EKxQ5MBhaSpR55GXXHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118982; c=relaxed/simple;
	bh=8srG042WcIwfpUeZ+HvXXN7keM9XIjBlEUNmAlUKTog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1eyvxrVX5w9gECfQHmEJnTC6vrarxPu7e4ZESyF7/nPHxLVjrc667HNKNuhFDcM/ZG9URjmnmxVSVXPqPT8vMdUXqL2+dj/2hDmAO+K9zvq8X1CKqJZdupJw0/hGPEOaS+K6soO2ZcAroKHyghBzi7W0Tx1Ju4a79TP27ZViLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyNITR6I; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so71296261fa.0
        for <linux-leds@vger.kernel.org>; Wed, 22 Oct 2025 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761118978; x=1761723778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TNLAjhkgqHZPN7SHKf/AirJr2ThqMNuItE7JWwCB04=;
        b=jyNITR6IoN/oGFbwQIDE4I9PAX6Q2bIUpqgrGEqgxZ5n0b4x+ViuKJErmcZnXiUmVn
         qURxHNiMHydDJtPeduU6PBdNCpJRzLVTE+FUO5iG1IHA/waCoZQvHmztpqLWDKGRjCxv
         hpFzOezYlQCWrkLnHURNtGAFFYlpSQE/q1ZsdGCSTm5jMzTq92Qh3RM6tcBwepdff65N
         TFE6DjzpaVpr6PN1jAIdCppadu1rz6//gm0FOQT450i2sgrKT2ot95UcEzEcCfTvZ7Dt
         HRPN3yBWZavKJglIfwn5NT57Km8freFxbVc9bFp5xlncwDC763W5soCtAN/c0FSCCFFX
         gT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118978; x=1761723778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TNLAjhkgqHZPN7SHKf/AirJr2ThqMNuItE7JWwCB04=;
        b=Uh4+2IUxGHgfGvH9dwerRhmhtFW3RthCGwBx30PEyLAlrsnURQfAKU3qNUpYbA4FKV
         MRCASCsFFNRC8/36r4yH7WEAZi3Y4nwfEnXtgybRv6sUpAhAZdH2fBmtvsIuxae6hvL/
         6BvrdOYA1goEwX+u428w8tRyVx5100kwjFg0a7HArL+JdlmQQaQZ3GA36cV1/7XQGSyq
         PYnJfaLkssUhHPCjaKInaGL5NyMoztfL2bhNpb4A78XAn7OUdXMeeNcPXnX8oK3CP1xD
         8p1PMzwAVuCQToaSjHOEJfzmih/+XSTQUv+64hnDCpPlVa9+qvtmNSSQzLy+w1yQNLR0
         1GhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUU4IbiskY4dKVFpphEhZgoLpdcv70UHNlEJaNzUShkm6YzzatMBsnIgvMgPhZQCxzAtYaj+PQAZvq@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbLKIb9n5KZyrW6Q5a0Rjw8QBRODiIOJ3rWekoxTi1j7ptncb
	ltfZdferZmCdN4fCAf8YPrr2TLL4YL7FOe7EaFlfTuMviBL5Bih5WfP7GCaHZoJw9J96RNIBAEz
	S9YmGuUuLLHK7x0WSuc0c7EBP4vaVno+D5Lbv83OJwg==
X-Gm-Gg: ASbGncuAIDM/rMDwgkOkby+6DUENzBqq5x2ynGGbP2hUHBwQID+lKf3X9PHxpnk17sm
	juHxFy5VEOpOEfYNU6vtRz9qJ2gKnk5gSP+cu61L4vWgoIYRL7vPzHedlwnwXcOWB/jZKcdft7n
	8wP0GFpR7boKkQt9nKNiqsWbi4G1wDBJK3b5K9/+TojMNJjVmfKf3RKLFPEJPPFgTkIwJiC2Our
	8pn2LRjjVEp0KiMiJD2HnUa6xBoqZFhzLhTEEw7V7iv8lmH75Pz1FSz4/D4ZVyWGxM+NcM=
X-Google-Smtp-Source: AGHT+IF3wmaO/RAI6AHRa1eUfLujsXfSoyOJjO3vVqO2wvb1ZTN3XsaW5H5jnTeROH/SrLDcnMyHtIhVSJKUnCmfyCM=
X-Received: by 2002:a2e:be25:0:b0:375:d1e4:21d4 with SMTP id
 38308e7fff4ca-37797a9f7cemr64226911fa.44.1761118978065; Wed, 22 Oct 2025
 00:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021142407.307753-1-sander@svanheule.net> <20251021142407.307753-7-sander@svanheule.net>
In-Reply-To: <20251021142407.307753-7-sander@svanheule.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 09:42:46 +0200
X-Gm-Features: AS18NWC4q1xLV5cdKOkaQ3Uw-5JkGYLVSUeBiCU5sYUK8C3AufUKZRqVPVNjL6s
Message-ID: <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sander,

thanks for your patch!

Overall this driver looks very good and well designed, using the
right abstractions and everything.

The build bots are complaining but I think you will have fixed that
in no time.

Just one minor comment:

On Tue, Oct 21, 2025 at 4:24=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:

> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.

This is Realtek, right?

>  drivers/pinctrl/pinctrl-rtl8231.c | 538 ++++++++++++++++++++++++++++++

Should we put the driver in
drivers/pinctrl/realtek/*?

Yours,
Linus Walleij

