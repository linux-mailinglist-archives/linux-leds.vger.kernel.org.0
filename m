Return-Path: <linux-leds+bounces-4115-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD6A48611
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 18:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D529017AD64
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 16:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B21F1D90DB;
	Thu, 27 Feb 2025 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQqwMY1Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF6C1C8FB4;
	Thu, 27 Feb 2025 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675293; cv=none; b=XXqASIuDzWUIIJK/4uQWtYu7QU7C5LWV769GlmzaiV9GSbkfG/PedPRo8E/qVUSI/jT3iFxqNQkUmkFJjM3ZDzJxNxNi3wV32HFgjnNmtrk05kTaVfRP+lfOCdGGXYUW4urQvHNJBJ4v0/cXRjXF8xuWT8hI2RIsfLxDIXd0bTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675293; c=relaxed/simple;
	bh=TmWvFUQLCnd+pivm8ZY7bZuz0W7aCNeXWJ0RoTa2c+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gI3vPmAhFvGOyyihLv8vbNp3gMXb5JwI8BJbtS7cMhqiwNWyvZYoRXAQHAjEkUhKfQqGQZA020pWv87PPnNav5CrUUSGovPpQ8ZCLsFj0FqHxIG7hT1eBayl3RbkUVB3fCB9uDG+sobIbHG9OuVaX+XK8gfk1FzElP1Ll0xf2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQqwMY1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E23C4CEDD;
	Thu, 27 Feb 2025 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675292;
	bh=TmWvFUQLCnd+pivm8ZY7bZuz0W7aCNeXWJ0RoTa2c+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NQqwMY1YlWROF/jhKfz7/qNDrFSjp2Zct7v1rFRjQyt2iXHOVqs62fwENRsOclyjj
	 oPwWoziE1f5DPbCwDPnbvVOLCmxG7vdiOVoqnbikss32WVtj0yqa1/pMR03vtTgIFQ
	 Zx4OkE3OXA625aSftS4YrglHEZhBuSYL8yYIPkfyoAgRxuUJLBV8g0/hs/w0TEvRDJ
	 XvIWSJ6KVfe5kkvk4VOdQLm9P/gLTYbiNi+D9MbWIdy9ZsN5SNJIHapRWOCHUhn6US
	 dVUPUx9zqNJ/lHrw0dbSLpadJybDzGtMdA8o3MNWheQzke/LI2wCHi9ibRTeKlyfxc
	 U8/6ykatlbG6w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, andersson@kernel.org, 
 krzysztof.kozlowski@linaro.org, 
 Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: morf3089@gmail.com, u.kleine-koenig@pengutronix.de, 
 marijn.suijten@somainline.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Zejiong Huang <zejiongh@qti.qualcomm.com>
In-Reply-To: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
References: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: rgb: leds-qcom-lpg: Add support for
 6-bit PWM resolution
Message-Id: <174067529045.3584478.9992009485506424464.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 16:54:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 12 Feb 2025 16:35:33 -0800, Anjelique Melendez wrote:
> Currently, driver only allows for PWM modules to use 9-bit resolution.
> However, PWM modules can support 6-bit and 9-bit resolution. Add support
> for 6-bit resolution.
> 
> 

Applied, thanks!

[1/1] leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM resolution
      commit: 7a3350495d9ae8ae5b178d603449d18fa7150560

--
Lee Jones [李琼斯]


