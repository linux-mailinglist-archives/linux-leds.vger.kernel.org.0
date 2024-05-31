Return-Path: <linux-leds+bounces-1750-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAA8D6209
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E31AD1F285CD
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B7E1586F4;
	Fri, 31 May 2024 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+/yTQ+d"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9650D1586CF
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159256; cv=none; b=ipJzsJ8EgONLuqk7g2VyWFsG+chswkqppbWIz47LIp9pOZZRYHU37K0AoWn8vVVfVO8mLns0E/3NpoQhRS/U25ngG38CqxgCEfkz5gKXskaCAwiTzxncHzYyrhIavVVrS+ag24KO07D1KAuucjpHH12hj2x157iQQ9uzwlDPxU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159256; c=relaxed/simple;
	bh=kG1GVQaKIypOUMZQ/sffNnsZ5//YIYCn6kWV9URvtAY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qX+Lhe2Ac33CZqt3szKCbYO01rpNzmx1nBVDHqOakSi94ZYhCl435rCXrjnOycshboCt9Y3M/oyACJAYJi4FbQaG2pX1EkZgL7b/QrydJ9bKHUjkNpFQj32/nxGvceEp7r5MsNxxb1ZAm+clrsjo4O3BTHxUTNr1Gl6+0eE96QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+/yTQ+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5A3C4AF07;
	Fri, 31 May 2024 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717159256;
	bh=kG1GVQaKIypOUMZQ/sffNnsZ5//YIYCn6kWV9URvtAY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r+/yTQ+d7AgUGMi9SyWPAfNAw+YijjDo5yN+gDemaPUNNq3yFofoKVdonWmsWkvic
	 aLvdahSsIcBUAiWs6TnL/ZYICVUUI0wWcbj0GnaCMsL6eaVEuPhD32ZP2prnp1SAbO
	 U4aj7LV3AL9g32s2N7w5uFHIW3cC6PVYSggvzPAZFK346PV8F+EfL11dJRG4LL8YS6
	 BxfF9Iz+FoNdKPLgumyW5gqnVkQ4jd9st/GeIAgqAbMCh7d5c8T8qV45z3biMA63f0
	 fR75CxKRCqzeTFX1z/iOwyCmUHH7Zup+7scH3BYc5EUlF1u9ZL9zH+RKhfTc5mJYW9
	 1RiR28r9TL1Og==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20240522165358.62238-2-u.kleine-koenig@pengutronix.de>
References: <20240522165358.62238-2-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-Id: <171715925492.1069447.2160724002738095628.b4-ty@kernel.org>
Date: Fri, 31 May 2024 13:40:54 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Wed, 22 May 2024 18:53:59 +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied, thanks!

[1/1] leds: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      commit: 4e84d53d7bf0fc35978fd41605d6d377c17a369b

--
Lee Jones [李琼斯]


