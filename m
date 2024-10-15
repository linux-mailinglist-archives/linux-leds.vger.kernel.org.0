Return-Path: <linux-leds+bounces-3091-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43199E2CF
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 11:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4862839F3
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 09:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A86518B497;
	Tue, 15 Oct 2024 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovSJbhRU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5264985260;
	Tue, 15 Oct 2024 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984628; cv=none; b=p5PliOZ4JioBSMeNEcDM79E7Lsg9l3pq2JNNoT77bJgkFU40+tKgVOfhKRDR/g3dszzg6RqHZEDTpZwYBGU+bS2S/tbdL9HeyF1H4KPMVabjoIGiJuzNu9idJ5f5kZ+Z5myUpej6hM+aRUiHsSqDUit2Ze5oLu8HCC2l4t0bNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984628; c=relaxed/simple;
	bh=PyLkawt3Ctd5wUXtSXeszN5JM22h+Eny77/oczq6ubs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ISyooJgR1Rdl6/ppPfeKzdfupup/sc6AZi26IsmE15F0yeo6uauCv8ZIuvcbL9aSimzdfOWaFMGjgKxCLo7iBRUawT5R3wwvxoCupZohZY5uuyIPS8Ive9e4w184YZaWvwsF/0Kgz64ZcDnEmP/6doL10FQ/c/jo+/ZHr3Zsghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovSJbhRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE74AC4CEC6;
	Tue, 15 Oct 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728984627;
	bh=PyLkawt3Ctd5wUXtSXeszN5JM22h+Eny77/oczq6ubs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ovSJbhRUKII2mP5UFZJDSUq1jSHSPyVfMn8Advj79JYcQcGh9+EW+DTPy4D146r4y
	 RLh7+bOKL7sQBIC220pPHV0htBubUC/w2Lnd1NVXiT0MkGXXUNtGV08QGDs3QJZK97
	 +G06IiS0RsUPbVjpGRlEmh0HO4uGOyelteM/vPCE7hAl/KblEMzLMIZJCXblVJsohL
	 5GWsu38G0cBikXT1ca3kgQEJ4s24icaBtvK52i+tcTUqxZ4jrf34QXmYgOKHJfJrkf
	 1QlasYcVNrV8eLXbayKlVW9tfSkWz1EZSQC274uXicopj5b6da++d5AGmCNSJcTNzF
	 2wVI020F/t0FA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BD43809A8A;
	Tue, 15 Oct 2024 09:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 1/5] dt-bindings: leds: add 'active-high' property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172898463271.1092562.11143129173306386760.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 09:30:32 +0000
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
In-Reply-To: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, lxu@maxlinear.com, ansuelsmth@gmail.com,
 bartosz.golaszewski@linaro.org, robimarko@gmail.com,
 rmk+kernel@armlinux.org.uk, jacek.anaszewski@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 10 Oct 2024 13:53:36 +0100 you wrote:
> Other than described in commit c94d1783136e ("dt-bindings: net: phy:
> Make LED active-low property common") the absence of the 'active-low'
> property means not to touch the polarity settings which are inherited
> from reset defaults, the bootloader or bootstrap configuration. Hence,
> in order to override a LED pin being active-high in case of the default,
> bootloader or bootstrap setting being active-low an additional property
> 'active-high' is required. Document that property and make it mutually
> exclusive to the existing 'active-low' property.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] dt-bindings: leds: add 'active-high' property
    (no matching commit)
  - [net-next,v2,2/5] net: phy: support 'active-high' property for PHY LEDs
    https://git.kernel.org/netdev/net-next/c/a274465cc3be
  - [net-next,v2,3/5] net: phy: aquantia: correctly describe LED polarity override
    https://git.kernel.org/netdev/net-next/c/9d55e68b19f2
  - [net-next,v2,4/5] net: phy: mxl-gpy: correctly describe LED polarity
    https://git.kernel.org/netdev/net-next/c/eb89c79c1b8f
  - [net-next,v2,5/5] net: phy: intel-xway: add support for PHY LEDs
    https://git.kernel.org/netdev/net-next/c/1758af47b98c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



