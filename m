Return-Path: <linux-leds+bounces-276-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9C8074C1
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 17:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D400D281CFC
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 16:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5EF4654D;
	Wed,  6 Dec 2023 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAXd38r8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCF4644C;
	Wed,  6 Dec 2023 16:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D090C433D9;
	Wed,  6 Dec 2023 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879542;
	bh=XEP1QVqzJ74XUk0NFatwejr8VZg7C0G6iCtNllQWctY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tAXd38r8uZwcO8Fros7ZsCKn4m+7B10wawkNfWtys4T5p+JaYTKtTAKWHaU8Ks6sk
	 xhuMVF7fw/Uj4kFkqrNT3AclnFABa+c3aDFHrP54d6/NHdbh29ahMl07d0TuKZJ1mJ
	 UUUpy9SPYF0xJODj95/Vf0m/ji+Bi/YEYYJoS9fifRoGvtfHymdmhBbhP6L0fqWPdd
	 4WOQW+sf69yrv5cFMwxfMKPnlTDU6yC0yhzvs7sGJ+R+H2hPzytyrvMqb2lhG61rVj
	 y1DHwz358tfheNRDStrYGxZcXyhcYz6qq0w+w19BUWWmD3SV2kFBbwMiAG0skllNlW
	 RO0P09CwlJX5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AB28C395DC;
	Wed,  6 Dec 2023 16:19:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] leds: trigger: netdev: fix RTNL handling to prevent
 potential deadlock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170187954217.26038.13218917015861949443.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:02 +0000
References: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
In-Reply-To: <fb5c8294-2a10-4bf5-8f10-3d2b77d2757e@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: ansuelsmth@gmail.com, pavel@ucw.cz, lee@kernel.org, kuba@kernel.org,
 andrew@lunn.ch, linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 horms@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 1 Dec 2023 11:23:22 +0100 you wrote:
> When working on LED support for r8169 I got the following lockdep
> warning. Easiest way to prevent this scenario seems to be to take
> the RTNL lock before the trigger_data lock in set_device_name().
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.7.0-rc2-next-20231124+ #2 Not tainted
> 
> [...]

Here is the summary with links:
  - [v2] leds: trigger: netdev: fix RTNL handling to prevent potential deadlock
    https://git.kernel.org/netdev/net/c/fe2b1226656a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



