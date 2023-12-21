Return-Path: <linux-leds+bounces-462-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8481BA2C
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 16:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5111F27435
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D1A405CA;
	Thu, 21 Dec 2023 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1dRf3zm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4713609A;
	Thu, 21 Dec 2023 15:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF728C433C8;
	Thu, 21 Dec 2023 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703171104;
	bh=S2Vdb7Rbo7d7VWMFognMh6YH/pfAtXvHqs7QhDzUIy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B1dRf3zmji/iMCtKp3HvDjDiPJIjsUv3pLXEmnGzZ3EjYFvlAcU99vTr8b/zAlTvn
	 Ayyf+SEKw3b7ZL+jpRXPP7PGGVnfcncVSCG5MyrIliNxP0I+l/VtaGd+BVq9vV7gBb
	 IrdklciFBDisJK+O8aJiz+OS+dwaGw+l40Kr8hqdS/3EWTV5jfdS4he+7HDimbiOz/
	 D+aR5HeTuImcpImD8qu92UquTjDRG7nUiLLlC3axkPtN+sGiHVCc1Fk2jX/upq6jdG
	 aTMJ6Y9wIUqXTDvoDtVWLEDJebdO7kMIZhfgfJL7Elioukk1E1GDXZtXaMwMErA3AL
	 2wdL18Yiy33Ug==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
References: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
Subject: Re: (subset) [PATCH RESUBMIT] leds: trigger: netdev: add core
 support for hw not supporting fallback to LED sw control
Message-Id: <170317110342.613451.8758128732864259581.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 15:05:03 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sun, 17 Dec 2023 19:46:42 +0100, Heiner Kallweit wrote:
> If hw doesn't support sw control of the LED and we switch to a mode
> not supported by hw, currently we get lots of errors because neither
> brigthness_set() nor brithness_set_blocking() is set.
> Deal with this by not falling back to sw control, and return
> -EOPNOTSUPP to the user. Note that we still store the new mode.
> This is needed in case an intermediate unsupported mode is necessary
> to switch from one supported mode to another.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: netdev: add core support for hw not supporting fallback to LED sw control
      commit: cb2ab62ae08af6a5ef1e3aaf954a8eaadd6ce17a

--
Lee Jones [李琼斯]


