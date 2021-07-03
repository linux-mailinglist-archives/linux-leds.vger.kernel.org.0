Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137D83BAA26
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jul 2021 21:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhGCTnV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Jul 2021 15:43:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhGCTnV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 3 Jul 2021 15:43:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DD2F461380;
        Sat,  3 Jul 2021 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625341246;
        bh=meEmE5F/1PERQTs4gOykkaSNzi60QDd9fhtgVarU6K4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=NmFq93EE5Akh7p6l1Cip4yU03ZTaCCp8o0PYZzea05BWlcHs5Mxk31c3S++CQ20v+
         TM9Mp0nLzIUEcRvzqSWDSEBjuEcIogem24VWeYS1vV9bgVtqKsBSCakE2dV+MO4oG8
         UIhbGggC6Roq8HCde7ekP3cCyE8UUhStfg1Zr5gsmevL1F4g8fAKDl19GjKeRbT9NL
         ACQLknYww6tLmHIT/OS4MRyOqrqQJUlVJm+mnybT3Y2ZK46Q3K/5WdahtiyOITXbWa
         GrukmL1yTb5KfzkCk9aSW5cOxQdj06yWPwMC/dem9BvFzXMpcUcXA5XoS3NzbBfYyu
         lbU6Ze3AnqClg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CA5CA60283;
        Sat,  3 Jul 2021 19:40:46 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v5.14-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210703133432.GA30301@amd>
References: <20210703133432.GA30301@amd>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210703133432.GA30301@amd>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.14-rc1
X-PR-Tracked-Commit-Id: 7b97174cc93fadb055258f4f8f3b964e9968e59f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 303392fd5c160822bf778270b28ec5ea50cab2b4
Message-Id: <162534124676.29280.16821671414656048507.pr-tracker-bot@kernel.org>
Date:   Sat, 03 Jul 2021 19:40:46 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Sat, 3 Jul 2021 15:34:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/303392fd5c160822bf778270b28ec5ea50cab2b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
