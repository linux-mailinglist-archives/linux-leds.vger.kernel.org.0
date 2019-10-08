Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1DDD03AC
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 01:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbfJHXAL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 19:00:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727675AbfJHXAL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Oct 2019 19:00:11 -0400
Subject: Re: [GIT PULL] LED fixes for 5.4-rc3.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570575610;
        bh=C0XJD5FYFH9paxnYhk3hBqFY2oFD7qIFR1TL0grXX1I=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=LYn6ib4jKB50vU7tD8yTi+ymYC1L24HLcMj3ocH3XF/9QmsCEXAKzlZx2t+MWDJZM
         EAufYELnlIeVzxC+0BiWobyU+BYLg5pit3lYXuykK97Sn1AvCgOaPixLXyeBU2BmA0
         ueWd7BYue3/8MPQjuFsheB/KOteUTFQDwY42J8Wg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
References: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 tags/led-fixes-for-5.4-rc3
X-PR-Tracked-Commit-Id: 4050d21d2009faccae5cab74eeb9f460f25d5108
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3280b54afed870d531571212f1fc375df39b7d2
Message-Id: <157057561082.22383.6124115707448720803.pr-tracker-bot@kernel.org>
Date:   Tue, 08 Oct 2019 23:00:10 +0000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue,  8 Oct 2019 22:42:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-5.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3280b54afed870d531571212f1fc375df39b7d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
