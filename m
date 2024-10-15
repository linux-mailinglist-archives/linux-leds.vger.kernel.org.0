Return-Path: <linux-leds+bounces-3088-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A175799E11D
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 10:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40011C2184A
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 08:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C861C57B1;
	Tue, 15 Oct 2024 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTK4HbXA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FEE185936;
	Tue, 15 Oct 2024 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981115; cv=none; b=cnshZbkf73MgnhmA2qO3s7pGuQGsqcsRxfe3XE4xpo6sodmCC2rCy/ILGmZmCLl6dkyEPNS2yFaDLPjYaHSojgbQsh5kC4xuox/ceE1huU4h1maAR1TT9tYWzLPwqEi/ujHxX8XQAQQ+rQw+jDDObggzLf5DgAQJvAvmh/4eknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981115; c=relaxed/simple;
	bh=czGm3bsjbOginSrzN3yTJzEs4FxqKQu7b+ZKVUrchuk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WFxyqE5duKaTvkY8xqIsw7EapGkwQ5Fzpn4fZZKzvF4Z4sr2zjfWBNYRJrkRhiMG8+aiu7Mt1FgbnTdQjoZ+nze3/Df2r2OPCqrG12Btjz0xloGZIBHZKEKN44t1aAezkBSRxzYZW1gsU27ePusDJSzszuJXMRTDURoVA4dmzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTK4HbXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECED0C4CEC7;
	Tue, 15 Oct 2024 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728981115;
	bh=czGm3bsjbOginSrzN3yTJzEs4FxqKQu7b+ZKVUrchuk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gTK4HbXA/7vb70s7Zutj2rEn64AKAmOMgyYLGQCfqs6FhyT0Y5XbcUhiQQVcs1W1g
	 MPDBUKlqFBEF5qGtFJbxpO7Egxsuh9uoFRk2cpPAjNf45HUyREVoKIMxh0PlXT0lw3
	 O39L+x3JdHwQUduLSL/3j8gSy4CKfq3Jiz3icOzDlJ1f5fmziEeX1ctUTrC+jIsYGl
	 tJz7mibI42FYaelzjPuvVtyNCpuHkhkD5RtsbMyXzIlKX03jvI5Xs0xdc3SWGMt5GF
	 pohvpF43mlH+2yLnA0Zk4ChseNxCoMbO4s7GmccVe27g3ULtGh0oVsogkZJCHCD/a1
	 wMj4zhVo7vUkg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Xu Liang <lxu@maxlinear.com>, Christian Marangi <ansuelsmth@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Robert Marko <robimarko@gmail.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
Subject: Re: (subset) [PATCH net-next v2 1/5] dt-bindings: leds: add
 'active-high' property
Message-Id: <172898111066.383402.12632073984288018090.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 09:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 10 Oct 2024 13:53:36 +0100, Daniel Golle wrote:
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

Applied, thanks!

[1/5] dt-bindings: leds: add 'active-high' property
      commit: fcaade450ea25e0162ee4a28ac0c7b911fa25674

--
Lee Jones [李琼斯]


