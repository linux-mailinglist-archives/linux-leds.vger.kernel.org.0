Return-Path: <linux-leds+bounces-5362-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83399B3FDE8
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 13:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2C32C4B4C
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 11:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04E72F83C1;
	Tue,  2 Sep 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="GS5m+T8F";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="BF76D3Ix"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-17.smtp-out.eu-west-1.amazonses.com (a7-17.smtp-out.eu-west-1.amazonses.com [54.240.7.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8372F5480;
	Tue,  2 Sep 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813075; cv=none; b=AjpQj1gtxx+WcBosv/J7BTcqpYxhLXj4VNxymw/t7IHuiawNb31sgWrG+yNELjrjxP1ZXN5bI6ho7F0Slj9sE9kRdvnvsV6q030y00dVVAbA4FJ7VE9CZyCO9RoascnDjcSwsdKi6OxK5YgKANaxLJohSzhZ5nE5wmwDIab/Zsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813075; c=relaxed/simple;
	bh=fOC4Ci7rmWLlE7+CmRAfLDBmJU7MR0vI9YnVYrlSdsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgqf+gtqrLyfElqFWYx6tpKfeRYQn2x89hL9UBNyOhQdQonIuSrcFuyOhiSYE3cHlLrzyu7Ni7ksyJoExQL5NbyElXtADpYQVtpffCHcfXiNWGVpaFPLsZ5k4q+1L2tj69P6NX14ceF9YjFBJMQ92f/oE8yqSZ57ddzyZGxrYk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=GS5m+T8F; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=BF76D3Ix; arc=none smtp.client-ip=54.240.7.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756813071;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	bh=fOC4Ci7rmWLlE7+CmRAfLDBmJU7MR0vI9YnVYrlSdsc=;
	b=GS5m+T8FZK6qKeVv0S/YnfwOt4bePcVCO3sg1SG/y1DrcR+qJeGVUbDkxjY2DZVJ
	5/ZI3FdrOHA9zz0HTaUjZ/HoFxVixBn1m3s4e9vmAe9JokzAc5tmBJ/MHOGqdq4Lr0Y
	kSYFBjRZIlmN7g73UUz/YDc2pecJhRqkse8HZO4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756813071;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Feedback-ID;
	bh=fOC4Ci7rmWLlE7+CmRAfLDBmJU7MR0vI9YnVYrlSdsc=;
	b=BF76D3IxKBXKwYPLYjeRlnh4T6QLeUN87UN823SBmZ+WfvRg6XhGNPVWaT4SJkco
	xn/YekpBRSIeML546kOmygch/CyIDgTXOASKpou4pBF1WEw85/r2MxzWsGx9YsOCqQ+
	r9nbQcR3uzQTx31ekLADkWBVeQXlTVFW2WWiEu8s=
X-Forwarded-Encrypted: i=1; AJvYcCUdr8Q4SriVn56yvkp9lcYApYGxLev8Coc2revJi3BCW/eOErj9AhckiB5h7GsZQ/BiMvS8Nx4zHMtIQw==@vger.kernel.org, AJvYcCVUCzeFSgaRBl3TKlBuo1387Ous67iIneYIJDMv8fLsZFNVeLw9dCsD2cnj5E9DItpWKnficg/fWCnk@vger.kernel.org, AJvYcCXjJl8yM+DnhlE+CGLRpc48XNiYUt+mhmjREZQZm1tLFrlr2vIQcsH2DKhAxvo9mN0WpvDTIh7ReMjfzseX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwch8aHq8crlSliTd95q4hxulZWa5nKGFsyw8ckZx825T2izud
	DTbClKMYKTFjVePSpHzdNNqFw/iuuZdbm1Tpefm6VpD3Dhcn0OvZ7aM8VctP0tC9dJVDwTo0qgI
	PaH0daX0Nc737wBMVNTs8TJXyRPPIcQ==
X-Google-Smtp-Source: AGHT+IGoRS6Anmy4FUFqU80ucZ82xuRteNGzwXhLzRMiAYKXGwFcbqiKUKj5DLqtoDKHzMojQVFURUY79tywi/kKb+g=
X-Received: by 2002:a05:6a20:3d19:b0:243:d3d3:61cd with SMTP id
 adf61e73a8af0-243d6f8e784mr16728686637.59.1756813069384; Tue, 02 Sep 2025
 04:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <010201990a1f5f7a-54dcbc11-1402-4ef5-8392-b1c5321e0f1f-000000@eu-west-1.amazonses.com>
In-Reply-To: <010201990a1f5f7a-54dcbc11-1402-4ef5-8392-b1c5321e0f1f-000000@eu-west-1.amazonses.com>
From: Alex Vinarskis <alex@vinarskis.com>
Date: Tue, 2 Sep 2025 11:37:51 +0000
X-Gmail-Original-Message-ID: <CAMcHhXpQ9hS+kZmO6QUBdiKExkQVBtd6YynM42a+3uWjD4dJyg@mail.gmail.com>
X-Gm-Features: Ac12FXxK2OJTgZUTwLgwtQWfzbfwE22Fh4nV2Pehy7wozep2EadnzcbzJfX3T_U
Message-ID: <010201990a3815b7-20d99ba4-7603-4bc8-8817-29398bb32972-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH 0/2] leds: privacy-led support for devicetree
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.17

>
> Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
> LEDs has landed, but the DT part was left out.
>
> With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
> mostly use MIPI cameras, this feature becomes more desired. Original
> rebased patch is still working as expected (with respective DT changes)
> on Dell XPS 9345.
>
> Changelog to original series:
> - Pick RFC patch, pick R-by, drop RFC-related commit message part
> - Add new DT binding to describe generic LED consumer properties
> - Rebase and test on X1E laptop
>
> [1] https://lore.kernel.org/all/20230120114524.408368-6-hdegoede@redhat.com/
>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>

Apologies all for the broken thread.

I have just switched to b4 with a different email, and it appears that
due to broken message-IDs the thread is not preserved. I will see how
to fix my email and resend it as v2. Content-wise this series is
complete, but it seems the cover is not linked to the patches, and the
series cannot be picked with `b4 am` anymore

Alex

> ---
> Aleksandrs Vinarskis (1):
>       dt-bindings: leds: add generic LED consumer documentation
>
> Hans de Goede (1):
>       leds: led-class: Add devicetree support to led_get()
>
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
>  drivers/leds/led-class.c                           | 38 +++++++++---
>  2 files changed, 98 insertions(+), 9 deletions(-)
> ---
> base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
> change-id: 20250902-leds-c61c877add80
>
> Best regards,
> --
> Aleksandrs Vinarskis <alex@vinarskis.com>
>

