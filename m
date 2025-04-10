Return-Path: <linux-leds+bounces-4449-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAAA83F1A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 11:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 482F6189FEB6
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 09:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BEB25E45D;
	Thu, 10 Apr 2025 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EH8b5En1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028D25A332;
	Thu, 10 Apr 2025 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277965; cv=none; b=qGSVZ+pkdcgEmz+bwlHNAfPT+hZpFbVK8gaFshc6H2p0Kg/IZ6UyACdiXNFm65FVxaKXye1Y7drDijDjYfhVJyWdXSIQfkC9NAkRjPCBTEVgbfbpiQ93yhh2asStmBXHHqCuNu3QgwFBBVEbQfZp77eQ4M1Pg+SlEwtQogjDvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277965; c=relaxed/simple;
	bh=IwjPHhP/v/Jh7FzxSq7DMwKlrjAl3R/TQrIMGZnxKNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jyTRr4oGAk6GiE72CmEdMzXD5OcreRXqLNwcibf9YArqEZIKv8TuZ5Th+G/9Fow6PBlEMEOObGwcycAWnTHrBazbb3w7CA3QBuQ2e+jIYV7Cl+aWpSC5IuTstzVfOH9f2ztJzsXkkE0ZdROlpagylDCY4hjAj5231QznVSNRtHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EH8b5En1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CBAC4CEDD;
	Thu, 10 Apr 2025 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277964;
	bh=IwjPHhP/v/Jh7FzxSq7DMwKlrjAl3R/TQrIMGZnxKNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EH8b5En1kyjDWn8NgXjDu6eTxUd9P/QBMW+jxyNC/om4BSu2L8jGYoirF/s5GH4sD
	 2PR7jgV7ikZTXTgNTYqS3njpSQP70ZC6IV2VH/5tks7tPOWvH7PjW19ctCCbmVDjjs
	 FNrwlFCrEOLCjEol+K62Q2tkEEtrES2X8hHYSSKu4CRAFt+KWCUuLWQ5CwFavgNdZ8
	 KC9h3K6gp0io88x8K87+Sq7+a2blQ0L8g7ioddYv4crYvfzrhIskVAi0essLsjrCXZ
	 FRV+LMthJea08d9U/72y5Cki/PzArtIM2wUDcVX0gyAg9QV8e9ssWbID2gIt4QBuzm
	 n+vp+Mk3vjuNA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, 
 deller@gmx.de, simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
References: <20250321095517.313713-1-tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev
 dependencies
Message-Id: <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 10:39:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 21 Mar 2025 10:53:53 +0100, Thomas Zimmermann wrote:
> This series removes the remaining dependencies on fbdev from the
> backlight, lcd and led subsystems. Each depends on fbdev events to
> track display state. Make fbdev inform each subsystem via a dedicated
> interface instead.
> 
> Patches 1 to 3 make fbdev track blank state for each display, so that
> backlight code doesn't have to.
> 
> [...]

Applied, thanks!

[01/11] fbdev: Rework fb_blank()
        commit: 93e41f968d7c6ea1cedc6b365917cbb787ef08f6
[02/11] fbdev: Track display blanking state
        commit: 7e3711eb87c584ed224a7ad7000eba36e6fa3a51
[03/11] fbdev: Send old blank state in FB_EVENT_BLANK
        commit: dfb4bf1ac40162ff5ea3715a10f6af2dcf3030c5
[04/11] backlight: Implement fbdev tracking with blank state from event
        commit: 726491f2038ec71122d45700f3abf36fdb277aaa
[05/11] backlight: Move blank-state handling into helper
        commit: 4bfb77f3381627640e97e0e423c93a2ea93e7de7
[06/11] backlight: Replace fb events with a dedicated function call
        commit: b01beb2f1f6bcda17634a5b529865ffc5a9b795f
[07/11] backlight: lcd: Move event handling into helpers
        commit: e98696cea7e289447a5d2328546b947629301616
[08/11] backlight: lcd: Replace fb events with a dedicated function call
        commit: bc70cc84f5a2ebfd7e7112e9b8837e0c7954fc65
[09/11] leds: backlight trigger: Move blank-state handling into helper
        commit: 28f8bab711c0984005a6dd4cc980b4ba8409b817
[10/11] leds: backlight trigger: Replace fb events with a dedicated function call
        commit: dc2139c0aa3283e5749109641af1878ed7bf7371
[11/11] fbdev: Remove constants of unused events
        commit: d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0

--
Lee Jones [李琼斯]


