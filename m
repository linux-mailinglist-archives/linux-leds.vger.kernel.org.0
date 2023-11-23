Return-Path: <linux-leds+bounces-98-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368277F5AAD
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 09:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E78B20D75
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 08:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6422E1C6A8;
	Thu, 23 Nov 2023 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvd7A4hF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736116421
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 08:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13566C433C7;
	Thu, 23 Nov 2023 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700729926;
	bh=q2nqQ+Ft1eQOUW2X9fgHDH+zIoCWzHvJ+cSPKg6Yw3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lvd7A4hFcdMNj5XSeCqeJ2MhP6sCi+JAPE3Xhxl5xsJ5vZnefKU5jnWSo/B3Xe8V+
	 uWPkaJ6XQ/o9btVX9i4Dv2zfn60ZZidA5YNG5xr3d8XO49SqUC6J0IJ8in69iX2wYt
	 GXDZaMGXROxvNAczsR3bFcpl2HDwyUZZB2HZkhsZIGZdaZiAs4tTn8iH/rn96iRxU7
	 BfOVuhhbwq3lg/3UMpIV3diMOnoX6y0j4CGlgqOtbtawy1lE/gh2Wme89SgInv+oaX
	 QbJvWHnkoBN20G1LIMalkM4M5wEw9ZSr/dRFUILoqDBT7qnLDOqpers90nl40WHxcC
	 R2ZZtQS/EIeoQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231025190619.881090-2-robh@kernel.org>
References: <20231025190619.881090-2-robh@kernel.org>
Subject: Re: (subset) [RESEND PATCH v2] leds: syscon: Support 'reg' in
 addition to 'offset' for register address
Message-Id: <170072992481.1182056.5764147055955802436.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 08:58:44 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 25 Oct 2023 14:06:19 -0500, Rob Herring wrote:
> The register-bit-led binding now also supports 'reg' in addition to
> 'offset' for the register address. Add support to the driver to get the
> address from 'reg'.
> 
> 

Applied, thanks!

[1/1] leds: syscon: Support 'reg' in addition to 'offset' for register address
      commit: 9add14f2aa3b7b456098819fb5e5750712db9cc5

--
Lee Jones [李琼斯]


