Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F19410E466
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2019 03:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfLBCFS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Dec 2019 21:05:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:53846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727699AbfLBCFR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 1 Dec 2019 21:05:17 -0500
Subject: Re: [GIT PULL] LEDs changes for v5.5-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575252316;
        bh=shnHspuNEyB+HT9GYrZFmLBaqfcrlUpBGIORO0Z11EE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=e01TU8UMewpLntxhe0nM8vueieYDILPfT1OsaTrJPRUkcDeMSLrgg+5WGge7VomLb
         ulWtWQXDRMfOc0q8gmoDm94XrekgO7QenDNpIGffvDCiWd2WifjNmqsYAPSuNZYM6d
         mvHlbky480DaxcEIPTPItcLH4dsDLlMniDgFl2YY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191127224614.GA24850@amd>
References: <20191127224614.GA24850@amd>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191127224614.GA24850@amd>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
 tags/leds-5.5-rc1
X-PR-Tracked-Commit-Id: 5f820ed52371b4f5d8c43c93f03408d0dbc01e5b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 304220b56e8c6a99b71832427802221be472247a
Message-Id: <157525231674.26823.10880597113358141112.pr-tracker-bot@kernel.org>
Date:   Mon, 02 Dec 2019 02:05:16 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Wed, 27 Nov 2019 23:46:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/304220b56e8c6a99b71832427802221be472247a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
