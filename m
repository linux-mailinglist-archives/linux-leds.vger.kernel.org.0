Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00DF372068
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 21:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhECT3M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 15:29:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229680AbhECT3H (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 May 2021 15:29:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6EE5D6115C;
        Mon,  3 May 2021 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620070093;
        bh=LJdkrc/ZTi/J5NU7EuVGuxr+lALb6uTKnI45n5FFt0c=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qswspq4lTt7/WQAZSPaX3zxNHKQvutqGhR0b02c8QPRoZd2+6mk/OhetHkqlniHvR
         8KR+loy1uDqD0zywsHwcMhI0wY14e5pDZrbQgmxVPQVdMSfxKiUDgGqGq9EVh5RLWZ
         /suKRSX9Xtf1LZ2hG99kzMatZ6OyCMhhrRg5blAe91C7yEH5vgtYNWF7X+wujo9uXf
         HQX+FWuizzkoTbyhl7QZkBN+pK2VF8w8fCVIr9c0oXlmjKV1QgXYajoNFkmgyPglDf
         JfR58hA4iW7n4G/MoGfRnbNVuCxc5PaMEZ4g3hvF7UVkm6yR26QPknM8/EGggaDgpi
         uKRvozi0eUi5A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 67ED9609E9;
        Mon,  3 May 2021 19:28:13 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210502220519.GA24775@duo.ucw.cz>
References: <20210502220519.GA24775@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210502220519.GA24775@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.13-rc1
X-PR-Tracked-Commit-Id: 23a700455a1bc55f3ea20675e574181b8c129306
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d835ff6c96ae6fa1ea474b0290a46e514ab6742b
Message-Id: <162007009341.496.16490295768351177617.pr-tracker-bot@kernel.org>
Date:   Mon, 03 May 2021 19:28:13 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Mon, 3 May 2021 00:05:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d835ff6c96ae6fa1ea474b0290a46e514ab6742b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
