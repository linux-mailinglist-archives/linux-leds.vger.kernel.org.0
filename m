Return-Path: <linux-leds+bounces-1911-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4079078A5
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C79B2131A
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622C130A46;
	Thu, 13 Jun 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKp6yVhc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62E63A5;
	Thu, 13 Jun 2024 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297345; cv=none; b=GX3pWrejo1H8XdGhbuzJARDkMm8Mj0Sgq7/BIlKuelN78hdC96rR3N+Se1a3T9cOSz0jYKyCGzipThRnnjK9mQhNF9IQLopC+XvDxIkcj5ZdHC7NHZOpK5jkpOIGqW1WqBigRXqzEaUQb+UnXIvb02yR0C4RSnP3kLM/pYOJ5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297345; c=relaxed/simple;
	bh=cXDfzoOwKRqGSzwNxg87SOL3BlAK0S91RSWtUV30amU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VUkO2CSr1Ty7n38sVj9Vg0FAt+qKj6+jz5EdoCVN0uXF5cG6mTGkUWfd1ZbtLimy/3py4TTVOdSbU7MiYlZayLgfYqifTpvs+w+tfRhzNkz3ViKw9H0M5+fTLvKWyDU74fdd3jifyo6mzArt+9sP3PAb9QKpdcPT2ectrUsF5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKp6yVhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508F7C2BBFC;
	Thu, 13 Jun 2024 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297344;
	bh=cXDfzoOwKRqGSzwNxg87SOL3BlAK0S91RSWtUV30amU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bKp6yVhckJhq4Ixx080oPJijRcC/j0BChXP0FprCj5qiwAgUDBPbf35SaLm740cUX
	 29hK0G44ZxDDma5/sWdka0cZDt4oCzapWj/G3juXA/03InqxZxc+epH0FlUHxhEByj
	 UXvoHTLPpzkpwOzBj0BCWeYp8mXwrXfVBEi+OspBLrPHgsWaAibPpNINC5VCDd8wk8
	 bt50cJm5mvs6y4Os3uHtcG4qs1Qb2lX9cbyXalyFb5vUo5D70ifSoq3QGeCvuYYwGe
	 QzGpsZsAihbqPVrWPrzO6PvPhp5y8b6CDSyfJ+tk/2wXFs++sahyj95M6WRSs12six
	 gI7eEnSietG1w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, stable@vger.kernel.org
In-Reply-To: <20240613-led-trigger-flush-v2-1-f4f970799d77@weissschuh.net>
References: <20240613-led-trigger-flush-v2-1-f4f970799d77@weissschuh.net>
Subject: Re: (subset) [PATCH v2] leds: triggers: flush pending brightness
 before activating trigger
Message-Id: <171829734304.2712359.10662321406977554017.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:49:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 13 Jun 2024 17:24:51 +0200, Thomas Weißschuh wrote:
> The race fixed in timer_trig_activate() between a blocking
> set_brightness() call and trigger->activate() can affect any trigger.
> So move the call to flush_work() into led_trigger_set() where it can
> avoid the race for all triggers.
> 
> 

Applied, thanks!

[1/1] leds: triggers: flush pending brightness before activating trigger
      commit: ad5851de0eb12e088a570092242e421cd00691c5

--
Lee Jones [李琼斯]


