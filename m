Return-Path: <linux-leds+bounces-176-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55C7F9CDE
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 10:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC611C20AC7
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9B9168D4;
	Mon, 27 Nov 2023 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYTQzupE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BB1117;
	Mon, 27 Nov 2023 09:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CCAC433C7;
	Mon, 27 Nov 2023 09:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701078151;
	bh=s8IyzUrs766+7jMN63nApueqFbMPrRSvwK0tNX8lytA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qYTQzupEPjYoRbU72dj6QUY9NK3mG46YHp028NRYh+zy7HRGAt/pXeEsYqm82sgsU
	 z6mm6kGWKDIlyxVomoj3gbgjXLqo8Pw2CGNEwF5RykppOzbXhhw3G6/T6aRPPXckrW
	 j24OVXmbT3WzbS1ydHno8vV83Kb0AEWM15QqKycyfOHNaurNYU4tClKqziGW5keJub
	 4ITT80Vx1T7KISPh+GqMe/fh96ByafQREIbfXZwhX0Zc2Ocpx+970tWbTh/iBVIz/J
	 +96Q8eCh8Aam1MONhj6aXv8kIdv+mRt6ualqXDKA3bh1aldbxBA5vPhd6cx2tX8iUj
	 opaEjc5menMeg==
From: Lee Jones <lee@kernel.org>
To: Eckert.Florian@googlemail.com, pavel@ucw.cz, lee@kernel.org, 
 kabel@kernel.org, gregkh@linuxfoundation.org, 
 Florian Eckert <fe@dev.tdt.de>
Cc: linux-leds@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231127081621.774866-1-fe@dev.tdt.de>
References: <20231127081621.774866-1-fe@dev.tdt.de>
Subject: Re: (subset) [Patch v3 1/1] leds: ledtrig-tty: free allocated
 ttyname buffer on deactivate
Message-Id: <170107814914.2407187.14845824595290761059.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 09:42:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 27 Nov 2023 09:16:21 +0100, Florian Eckert wrote:
> The ttyname buffer for the ledtrig_tty_data struct is allocated in the
> sysfs ttyname_store() function. This buffer must be released on trigger
> deactivation. This was missing and is thus a memory leak.
> 
> While we are at it, the tty handler in the ledtrig_tty_data struct should
> also be returned in case of the trigger deactivation call.
> 
> [...]

Applied, thanks!

[1/1] leds: ledtrig-tty: free allocated ttyname buffer on deactivate
      commit: dcc9a56adb91830b14e4838de95d3e85db35a0f4

--
Lee Jones [李琼斯]


