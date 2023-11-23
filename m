Return-Path: <linux-leds+bounces-106-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 684ED7F5D20
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 11:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2341C20D5F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 10:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB27224FB;
	Thu, 23 Nov 2023 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzTpA21f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8AA200CD
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 10:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F4CC433C8;
	Thu, 23 Nov 2023 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737149;
	bh=90AhqRMEb1URW49+jHELClQUBz+rpek7dQfPYTTBU3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pzTpA21fS4E7VIIiK2AXpbARKJ2zwaJ85J26OuY9iHMSe9nF9HGOzknVg89sSfG/p
	 8rhPDqVk66jHZnUtBl3nhNJBoDQwPn5/2Yqcwn+LXhSIuO8EMDCn8CuH6va9vfvKUY
	 n1vT3pHE4w1bgae+55qFsbP0qIETsPqODGgnoEfPwrESC8tke2xn8/i9rYtTIi85gF
	 +jMfVWiDr97CdQOj9XegXFDPiuW0kFQTLprTCm+8sA/vOtWWbsGFSdA1KVdPl/2ybB
	 9HC3oHPyBC+qUHawUi4cs+MI0tTvhi4KOwCnmk2j6clJmnQ8aFGYhEhhjOsd9eQW9r
	 4tzxVGQ3drLoA==
From: Lee Jones <lee@kernel.org>
To: Dang Huynh <danct12@riseup.net>
Cc: Nikita Travkin <nikitos.tr@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231103114203.1108922-1-danct12@riseup.net>
References: <20231103114203.1108922-1-danct12@riseup.net>
Subject: Re: (subset) [PATCH] leds: aw2013: Select REGMAP_I2C
Message-Id: <170073714794.1242990.14043054450989948510.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:59:07 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Fri, 03 Nov 2023 18:42:03 +0700, Dang Huynh wrote:
> The AW2013 driver uses devm_regmap_init_i2c, so REGMAP_I2C needs to
> be selected.
> 
> Otherwise build process may fail with:
> ld: drivers/leds/leds-aw2013.o: in function `aw2013_probe':
> leds-aw2013.c:345: undefined reference to `__devm_regmap_init_i2c'
> 
> [...]

Applied, thanks!

[1/1] leds: aw2013: Select REGMAP_I2C
      commit: 5de5423bb5f7c1a20f00a0f45ca38e533714fcfd

--
Lee Jones [李琼斯]


