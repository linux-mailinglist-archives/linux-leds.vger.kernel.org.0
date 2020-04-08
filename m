Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA92E1A1A41
	for <lists+linux-leds@lfdr.de>; Wed,  8 Apr 2020 05:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgDHDU1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 23:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbgDHDU1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 7 Apr 2020 23:20:27 -0400
Subject: Re: [GIT PULL] LEDs changes for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586316027;
        bh=qSkgLHCzBoNNW4IoSCmeylFlUu4aRmy4OtTMj0MCwcQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gsfe9zmkqoauYrOYsKFZcmkDMTHmI3+mjWK98SsZhnXfbwLWSGIq0iTMUe/x3Z6up
         bv1kSkm98NqAiuzf3b30UJmNfeIeg7y5ngYmVH4gmDUnly9tDpq7O3sWaORPtNY4UA
         toNSftDJVgAmmtMtEGKOsaKPawzhAO5haB24FfyE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200407075753.GA19187@amd.ucw.cz>
References: <20200407075753.GA19187@amd.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200407075753.GA19187@amd.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
 tags/leds-5.7-rc1
X-PR-Tracked-Commit-Id: 64ed6588c2ea618d3f9ca9d8b365ae4c19f76225
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38e2c63ec3d323310ba873601e864af79b90b457
Message-Id: <158631602699.18814.1138317331447805965.pr-tracker-bot@kernel.org>
Date:   Wed, 08 Apr 2020 03:20:26 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue, 7 Apr 2020 09:57:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38e2c63ec3d323310ba873601e864af79b90b457

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
