Return-Path: <linux-leds+bounces-2307-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B35ED93BD2E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 09:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EED5B212B3
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC86716EB50;
	Thu, 25 Jul 2024 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv/6J7Ns"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362016D4EB;
	Thu, 25 Jul 2024 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721893047; cv=none; b=j2lKZgA+KZV5ey6LFt1sUAiEPGREm1luAWn6DS7g3XLzjqt2QLQNxrqeeMEuaU51IvskM1iGEJ++L+iAjpQKJhUjgDR1heelIshxYW/+zbWJ4sAkyRGBX03w8NyUOEc3KHyOYI1BkGOMge9P7kJo3ij0I0KDWHU02gpuBBmL/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721893047; c=relaxed/simple;
	bh=ttSDMeENsL/YjuqtLkhBSuK5q/wRicS92KYkoHzsHiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h7cubC210rbggbeFZ2aQUfh5/EzJ9585xXYutDeoctbJKVXoqN9XR03F3S8hb251jJQ4FUKSfklaQYDYqRFZyIdVZWQOUReIQ0ggbQVWlYqLMwHuYb2eotj977muV0sAOvJ9PiDwUhtTf0MgVUVCjQmEAP3ekeTbM14gYp9mraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv/6J7Ns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBC4C116B1;
	Thu, 25 Jul 2024 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721893047;
	bh=ttSDMeENsL/YjuqtLkhBSuK5q/wRicS92KYkoHzsHiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gv/6J7NsLJqCZmPsl49ZW/7PBoxrVwUTz5gpN6bEAF4RJ4gcDd4Fn0ih77ECDAm6z
	 khycOdRL2ZmYedH5m+4HV6Aldpw9Jbi/Jm2hF3B2LU7bp2Vyq4m4uECryNnEPezoYN
	 mq6cPY90TNa/Qj8ZRpz/3mPZmdknOFShg23VQzjCDhsNgtPNOu5lZcB3Nf8XvBeQXH
	 W8vZ+FCLhK9sGiixBOjPEzC3oGUzmqLDsrPT9sGd6vPH1/wBwVLHgVFIc8ncDO8u6i
	 kwNcviv8kit1pw1fXja2P/FUuQdsozyU9+n+GYj3E379hO38PLoQSIKkt1mePcN5Jz
	 GRtEvpuMe6Eag==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jack Chen <zenghuchen@google.com>
Cc: Mark Brown <broonie@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <20240704191500.766846-1-zenghuchen@google.com>
References: <20240704191500.766846-1-zenghuchen@google.com>
Subject: Re: (subset) [PATCH v2] leds: lm3601x: Calculate max_brightness
 and brightness properly
Message-Id: <172189304588.827855.15843679475980331109.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 08:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 04 Jul 2024 15:15:00 -0400, Jack Chen wrote:
> The torch_current_max should be checked not exceeding the upper bound.
> If it does, throw a warning message and set to LM3601X_MAX_TORCH_I_UA.
> 
> LM3601x torch brigthness register (LM3601X_LED_TORCH_REG) takes 0 as the
> minimum output (2.4 mA). However, 0 of led_brightness means LED_OFF.
> Adding a -1 offset to brightness before writing to brightness
> register, so when users write minimum brightness (1), it sets lm3601x
> output the minimum.
> 
> [...]

Applied, thanks!

[1/1] leds: lm3601x: Calculate max_brightness and brightness properly
      commit: ef23c7b35efb9cfa0b56fbb7fdf3aa782b1c2b87

--
Lee Jones [李琼斯]


