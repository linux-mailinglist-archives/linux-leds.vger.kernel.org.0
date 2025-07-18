Return-Path: <linux-leds+bounces-5097-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD71B0A51E
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A572A80CE8
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 13:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94D72DC342;
	Fri, 18 Jul 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQNwm/r6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806712DC339;
	Fri, 18 Jul 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845235; cv=none; b=YKWikKrxzYwrCbV9WRH0pR9YoKuuKvjqVLr/ePckbIPK9iC9shtwTkTd/JWCRhnVRZGZo/olxS3C1tg/yl4aN1Onl5jn/ssfurJeV+NjiUc5DJQMlVKccaYCvzgxgbKeFRP5YwuwQ+TICc/KWrJ8zHDuNVXTw8uBbsCKQx2pRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845235; c=relaxed/simple;
	bh=3C93CVRHfxkm3Syt4tid80ikvyc5gr5rgpPz3ue5Eh0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GJSzZRDNNb5Exist++kHjIrvQcJCUv2z24AjNnjMf5/n9UvkdXAciZrTpVivRIlqAPBDpvZSP2m4zv1Xfpl4j4Q6f3GK2LXYy/FJw0vYhv6QMQEeK9L1P2YtvQ9Y5gVHfXNbSyVHBAptmb5NReN+l6NFesC0NOo1zzLurK4wxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQNwm/r6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93830C4CEEB;
	Fri, 18 Jul 2025 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752845235;
	bh=3C93CVRHfxkm3Syt4tid80ikvyc5gr5rgpPz3ue5Eh0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lQNwm/r6aFYxg7sbirrJEoKuQymT76ZYtne1msCBr6Nqqe1EqBXZ2bqWInCPkFqrZ
	 nEziQl3u+3wrm67oAQkD7YPU8N6E7SyXB6KtBq9FWcsElvHB0jTvNQXfUNpU3Y5o4X
	 IPMeaD23GkcKxojKrVTjRxMtwmnj8BZT+v+G/NXnD8b7iRT198CFGzSSVClkaZqWJA
	 lwowVGX3FvfUSu37n1uFvivmQJ7rgHM+D2TRaRRWZO+Hxq3mnNtV6AIcNOaeT4hZti
	 TIFt3dJhev04JCp896LnBeErX5lp9G/lRUw7Gb8nHyY7ok7Uc1zlqYQw1GufzkHsQe
	 omSuMmcGzhxVg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Marek Vasut <marek.vasut@mailbox.org>, 
 Lukasz Majewski <lukma@denx.de>, Christian Marangi <ansuelsmth@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <6dcc77ee1c9676891d6250d8994850f521426a0f.1752334655.git.daniel@makrotopia.org>
References: <6dcc77ee1c9676891d6250d8994850f521426a0f.1752334655.git.daniel@makrotopia.org>
Subject: Re: (subset) [PATCH v2] Revert "leds: trigger: netdev: Configure
 LED blink interval for HW offload"
Message-Id: <175284523331.219050.5074159339576881850.b4-ty@kernel.org>
Date: Fri, 18 Jul 2025 14:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sat, 12 Jul 2025 16:39:21 +0100, Daniel Golle wrote:
> This reverts commit c629c972b310af41e9e072febb6dae9a299edde6.
> 
> While .led_blink_set() would previously put an LED into an unconditional
> permanently blinking state, the offending commit now uses same operation
> to (also?) set the blink timing of the netdev trigger when offloading.
> 
> This breaks many if not all of the existing PHY drivers which offer
> offloading LED operations, as those drivers would just put the LED into
> blinking state after .led_blink_set() has been called.
> 
> [...]

Applied, thanks!

[1/1] Revert "leds: trigger: netdev: Configure LED blink interval for HW offload"
      commit: 26f732791f2bcab18f59c61915bbe35225f30136

--
Lee Jones [李琼斯]


