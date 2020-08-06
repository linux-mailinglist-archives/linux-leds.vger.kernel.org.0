Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2161923D5AA
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 05:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgHFDIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 23:08:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:58770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727045AbgHFDIN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 5 Aug 2020 23:08:13 -0400
Subject: Re: [GIT PULL] LEDs changes for v5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596683292;
        bh=u328AGYVGNQ25L1MSNT96DWiLFdpHDjM2YuMOJ/gqCU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=IKMqISo4NEo6AUsriAgXULGoXq5024ClL/4S17EGIlgZLlABBN8K2nfux7xdYNYu7
         8pUiNnHMKf0nAb+JFk30t1Az32ragJr5eLvi0rfRZ27bQeYBB0iW9IE0CIUEuPC1KT
         dMYmiozpZMPFChaVIz1fEktAFMmwwKlG800qDBLo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200805213329.GA15090@duo.ucw.cz>
References: <20200805213329.GA15090@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200805213329.GA15090@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.9-rc1
X-PR-Tracked-Commit-Id: bba37471de2d7733b0deef57e03c47fa97a284a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d
Message-Id: <159668329245.23142.18018972892801501372.pr-tracker-bot@kernel.org>
Date:   Thu, 06 Aug 2020 03:08:12 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Wed, 5 Aug 2020 23:33:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4a7b2dc35d9582c253cf5e6d6c3605aabc7284d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
