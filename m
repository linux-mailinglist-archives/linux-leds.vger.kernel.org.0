Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E36A442591
	for <lists+linux-leds@lfdr.de>; Tue,  2 Nov 2021 03:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhKBCWm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 22:22:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhKBCWj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 1 Nov 2021 22:22:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F1BD60F0F;
        Tue,  2 Nov 2021 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635819605;
        bh=dj7sEltdqY2u0fwXET2AARtOVatj/yHTRTq1TKtMbVk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=RhCMQB4KaOlgM8/r0WOa1koocXQFMR96OJd5820YAk+nQUk2X8ujB8BhlQtZ88n3g
         Mu5rjs5N32LcrWyhjaCQLgtQp9zuwWCSLOb+LIXirmhKhumj+rq8WEJ0HyJIUTP5uY
         akt2E7H/f93YcrekNqbnTTakfucLtTL+RA1le7zqR/hIwXT0dCBI7kwHe0DCPlT7oq
         7Rzks702yvazTVIJprt6m4gGzlXdhIBj6w2oGdqsBIvlQ22bk7IbfzP5uxeyrvgVoa
         Uz2NHF1HJAvDDfGGr04GenQhZIuyCbooBt139kb20tveEMZU/bQdlAeWv0avpHPWZ2
         xCjOOJi5SwpdA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2430260A3C;
        Tue,  2 Nov 2021 02:20:05 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v5.16-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211101111354.GA29161@duo.ucw.cz>
References: <20211101111354.GA29161@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211101111354.GA29161@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.16-rc1
X-PR-Tracked-Commit-Id: 97b31c1f8eb865bc3aa5f4a08286a6406d782ea8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4dee060625e1095c7065fead542e96ba9504c7eb
Message-Id: <163581960513.22980.7310812582024098705.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Nov 2021 02:20:05 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Mon, 1 Nov 2021 12:13:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4dee060625e1095c7065fead542e96ba9504c7eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
