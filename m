Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F2F28E904
	for <lists+linux-leds@lfdr.de>; Thu, 15 Oct 2020 01:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgJNXCL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 19:02:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728925AbgJNXCK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 19:02:10 -0400
Subject: Re: [GIT PULL] LEDs changes for v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602716530;
        bh=YDA/hYSrZFxzUDn7A/PLKOI14rok/C5bkmVCZAd4izU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=QVfxyUoOC1oRyudIZWTVQr+aCUvSpF/ArzJkIb1MbMc1LMjiSVX55Esgi88BX/BUV
         UCQY7umEXMtP7z7SzqEBvbmmKHs/CGxjH4/oXsx8uynyr+20KSHYWsPxWjpCTR0AsD
         wv+u9wJbA6ikNds/GNBvdj/BmohRURHO9g2nE/0E=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201014110556.GA19009@duo.ucw.cz>
References: <20201014110556.GA19009@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201014110556.GA19009@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.10-rc1
X-PR-Tracked-Commit-Id: 19d2e0cef0b14f8c7210162f58327485f5fa7c51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fafb54c7d390e9b273a1d7d377e38d9c408046e
Message-Id: <160271653023.18101.10646997334372470012.pr-tracker-bot@kernel.org>
Date:   Wed, 14 Oct 2020 23:02:10 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Wed, 14 Oct 2020 13:05:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fafb54c7d390e9b273a1d7d377e38d9c408046e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
