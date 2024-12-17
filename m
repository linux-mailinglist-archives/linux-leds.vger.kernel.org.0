Return-Path: <linux-leds+bounces-3622-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77D9F4C35
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D805B188565D
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6191F4E23;
	Tue, 17 Dec 2024 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqOimGIf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562871F4263;
	Tue, 17 Dec 2024 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441065; cv=none; b=mfApeHeohxx6ddgcckE3uce5Mv6Ql+rxb+JhyDKOL6Bl7rv/yDbtlsDhaML3rA+vs5TX26w0wzHBIkK0z30r4vCy30PWe7qhsxiB0UJRToR2hOk3wXrzUybhet9GXq2OOrB04FnYuToT6EVMaOAaHdcG9dKVG8Hc2N7E0ObzxzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441065; c=relaxed/simple;
	bh=gvi4zhWgM7DuHNfwNNofUajiRjxTUQvFyFuksTf+yp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M/hbG3zjX6hKQ1X4rfGlYl9/aHw+EyCgyF1FsgijYSZxiYPNcNL2Csm2XpUXJdb23HM1B9kmBZzv1USteizqk7oIEuNX+eyN6eiQPt7JlWaGD4Tr3XKwvkUHyNM1x7z4bXFyK29Iawh/RdVWXvhwjxroYXmYvL3N4NHJLVTrbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqOimGIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DDEC4CED3;
	Tue, 17 Dec 2024 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734441064;
	bh=gvi4zhWgM7DuHNfwNNofUajiRjxTUQvFyFuksTf+yp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZqOimGIf2rOEexCodXE54xgPWFKWsQXh5DQa2JIZ9Tot/zm+1AoDDBiARLImOU/if
	 Ws7+/5BVWIa1ZnCK204U90bOnu2ShWueKtiMG75VAGzEkgw1cS66vynbyrm+loKCJ4
	 0hBn+pdPR3JygijFBGes37/ZEPD/8SqK+h6Uk3AtF0JSbO//FC593HwY7fV1sqqPw7
	 pDGB+lPknl/hBg1Ji3TssKeRo9eAOfMX1DjV23k4PgqCaMF+a4gkxfk0Fhs46+4xac
	 UrECY/jXq4Ubi3Jm0fgg0Gca94ObsZw7uDpUcgeetcK09Lid1C+Lb+reyMTZgbTkKG
	 cJeC/0dgeJ53g==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 netdev@vger.kernel.org
In-Reply-To: <20241216104826.6946-1-marex@denx.de>
References: <20241216104826.6946-1-marex@denx.de>
Subject: Re: (subset) [PATCH v2] leds: trigger: netdev: Check offload
 ability on interface up
Message-Id: <173444106208.1701236.11464150864495831064.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 13:11:02 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 16 Dec 2024 11:48:22 +0100, Marek Vasut wrote:
> The trigger_data->hw_control indicates whether the LED is controlled by HW
> offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> currently called only from netdev_led_attr_store(), i.e. when writing any
> sysfs attribute of the netdev trigger instance associated with a PHY LED.
> 
> The can_hw_control() calls validate_net_dev() which internally calls
> led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> is not attached.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: netdev: Check offload ability on interface up
      commit: 0dfda50988c6805e8ab432e99866a021ea6ec46d

--
Lee Jones [李琼斯]


