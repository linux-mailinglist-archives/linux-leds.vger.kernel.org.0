Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C501EEA3B
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 20:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbgFDSZQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 14:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730434AbgFDSZP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Jun 2020 14:25:15 -0400
Subject: Re: [GIT PULL] LEDs changes for v5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591295115;
        bh=Ri46w9aH+hcb5dojslGGxtuTxDP3Ok5w9s2kHVDFIFM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Mp1HNkzf9M/Vts2udph5HfXoQURJIGWg7voQktq8f84KtYU8u8+bubIeP1U+F/m2F
         xmthWHunz4Du2lS7oWz9hteXpO6EQdk04Ussz0Izyl2Fj81OCseW1nkbYfX+VOhwMt
         dNdjWea0n7DGHYIzbNsBK5oDwxv+ZVdQ8xdTHcU4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200604121905.GA4931@duo.ucw.cz>
References: <20200604121905.GA4931@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200604121905.GA4931@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
 tags/leds-5.8-rc1
X-PR-Tracked-Commit-Id: 59ea3c9faf3235b66bc31ca883d59ce58b8b2b27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86c67ce20d080bdfefafd461d3068cad0a49a66b
Message-Id: <159129511534.18772.2353289185245530089.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Jun 2020 18:25:15 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Thu, 4 Jun 2020 14:19:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.8-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86c67ce20d080bdfefafd461d3068cad0a49a66b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
