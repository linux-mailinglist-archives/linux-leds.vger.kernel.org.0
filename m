Return-Path: <linux-leds+bounces-4489-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D171DA8A55E
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 19:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462EB18872C7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 17:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAD02192E4;
	Tue, 15 Apr 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrCuffwJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC02DFA41;
	Tue, 15 Apr 2025 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738030; cv=none; b=KTUNwS3NEgtBBBXfXP5z8RPcJPV8teE4PaWDH6r9M163wAWq2/eWDQuYYspE/Cr2VjDRsj+vSG5jjKKXdHXOMc+6POMSEDwuwgTUZ1/zkrzBwqeUyFVSWF3VJSVbQLIBX+B9JZiTO7SQZ+d+ddnomTXaxw7fCpL91+mfdV42pIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738030; c=relaxed/simple;
	bh=6XeNlOlstSEOvXo8EXHHR0/S7hM3KEkYdwSBdSs518A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6Ie+8AE1O7jxoiqUce85WRISYIXoDzK7g6U/Zqe6r+BmFVDC/759ijMVghxpTTCMnyLrG5YwGjvgxco+FpqipNQzLLVE0tYrLrW56XdNgnCtRGSPqUdKh1awr3P574DqHVD5QBXrBs8vWK1zxSAJcKtLeBcFD31oh+5hlJJXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrCuffwJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A6C4CEE9;
	Tue, 15 Apr 2025 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744738029;
	bh=6XeNlOlstSEOvXo8EXHHR0/S7hM3KEkYdwSBdSs518A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrCuffwJ5VOaNT2JyDtNIp2H41cBzWsyHZs8gQrKUr8R1Qvk9nP84I+cX00JMwv1B
	 xTnwUYGN738eXTGddu96j7p0cbrHEjc7BocO8USYlkSwbIubencyBwKA3/GAKRMc8r
	 xXv3eGUudononhdBSZoekiVZZzfhZzgw7r9PYp6E/gryXbpU/+AKSkxA6HL3mDBnK1
	 BWHIJRfrIASQBOdwAShczWQVSACVuboOfmAQHqfF6KX6Cvk5mYDH4uOe7FM3trlQoO
	 8QiK4El/1xypAZ1hhsoxoW1yLSuydluvQbs+YmOSfaOUnkXMb13oH2zRm7QqslTIbm
	 f72BfbsYUwX1Q==
Date: Tue, 15 Apr 2025 18:27:04 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [GIT PULL] Immutable branch between Backlight, fbdev and LEDs for
 the v6.16 merge window
Message-ID: <20250415172704.GD372032@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-leds-fbdev-v6.16

for you to fetch changes up to d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0:

  fbdev: Remove constants of unused events (2025-04-10 10:39:14 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, fbdev and LEDs for the v6.16 merge window

----------------------------------------------------------------
Thomas Zimmermann (11):
      fbdev: Rework fb_blank()
      fbdev: Track display blanking state
      fbdev: Send old blank state in FB_EVENT_BLANK
      backlight: Implement fbdev tracking with blank state from event
      backlight: Move blank-state handling into helper
      backlight: Replace fb events with a dedicated function call
      backlight: lcd: Move event handling into helpers
      backlight: lcd: Replace fb events with a dedicated function call
      leds: backlight trigger: Move blank-state handling into helper
      leds: backlight trigger: Replace fb events with a dedicated function call
      fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  48 +++++++-------
 drivers/video/backlight/backlight.c      |  93 ++++++--------------------
 drivers/video/backlight/lcd.c            | 108 ++++++++++++-------------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 ++++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 +++++++++++++++++++----
 drivers/video/fbdev/core/fbsysfs.c       |   8 +--
 include/linux/backlight.h                |  32 ++++-----
 include/linux/fb.h                       |  12 ++--
 include/linux/lcd.h                      |  21 +++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 215 insertions(+), 208 deletions(-)

-- 
Lee Jones [李琼斯]

