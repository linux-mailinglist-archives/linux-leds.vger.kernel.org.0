Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B05309EC2
	for <lists+linux-leds@lfdr.de>; Sun, 31 Jan 2021 21:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhAaUNA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 31 Jan 2021 15:13:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:50808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231137AbhAaTgC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 31 Jan 2021 14:36:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 59ED664E31;
        Sun, 31 Jan 2021 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612121720;
        bh=AJhSfiFvoAWh1N79XYjqFtt9SCyfXn3BWBzWU/rSBi4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ncxsh5/bxxHoPZ/19brk6vbFDztuceXXhA9tddmrs16S9NmTbhLh4jRaGpyo5QFV3
         irrMXIWVimlMagDyY0vv4QAOozg7F5/1aIUe/Xo1z5s/H5ueOyEi5WKgAV3uE9yfEq
         16Gk+iLWRVuSA4S+OvXhULQ5mFuKDutRwk5H5/os+Sy334HMlcGxrh0mKcAGzGE5w3
         0bwaSW89TMcvgVkY1jJm98sl1NkxK0n00CgqLFDOsDnK2YwwPI4j+qpiG0bjPnCEaD
         sC7S1AnBsLfa+gekEMj/JIG60tSc92FIAqD+8yyXc7q68d1vX/LlLgxZ4X076ecbXX
         /3/loAD18HdUg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 48165609C6;
        Sun, 31 Jan 2021 19:35:20 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs chagnes for v5.11-rc
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210131094255.GA31740@duo.ucw.cz>
References: <20210131094255.GA31740@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210131094255.GA31740@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-rc-5.11
X-PR-Tracked-Commit-Id: e1c6edcbea13de025c3406645b4cce4ac3baf973
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29bd2d2100dcd98455c5f2dff391a88c5b44a6b2
Message-Id: <161212172023.26762.11083214605908540466.pr-tracker-bot@kernel.org>
Date:   Sun, 31 Jan 2021 19:35:20 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Sun, 31 Jan 2021 10:42:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-rc-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29bd2d2100dcd98455c5f2dff391a88c5b44a6b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
