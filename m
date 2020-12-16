Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E912DC970
	for <lists+linux-leds@lfdr.de>; Thu, 17 Dec 2020 00:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgLPXLe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Dec 2020 18:11:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728529AbgLPXLd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Dec 2020 18:11:33 -0500
Subject: Re: [GIT PULL] LEDs changes for v5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608160253;
        bh=atO6XRT3h09vgDVfNPOGFhIdV4mbhGmhbDSF+zCvlaw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mBFJtb/eez46OcznP7mypXvmwntO4MKzUtw7rbE4YlfuNg0Lc0qEaLqwm9+imoNkx
         lXdBnD8Pc4B6v4omoyUYjYXaoLLgZw9F5LAVtFjipjmvlWoo+7ijsk5epmHTRuwp9o
         HUpukw8IQXskmBnKAkOnK84BDV+7XiDKgG2BoJOBex+qvR6F+lE8SbRR1PVt3qwnOd
         OBp9h8qNNyltz3spgbwjYSSq7JxgV3iZNjOu6Oct8B0F86Sime6ogMDEUMFaaOWwhl
         WATirM5mjeC/fr0DqWKH0gIjMEf0F5sTd/2uGzNCakKc5gDdh+df/K+53aFGjw7EM4
         ylOnpFNE1rDwA==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201216154155.GA10814@duo.ucw.cz>
References: <20201216154155.GA10814@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201216154155.GA10814@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.11-rc1
X-PR-Tracked-Commit-Id: 98650b0874171cc443251f7b369d3b1544db9d4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 945433be3677955255fabecbf1076c17864ff9da
Message-Id: <160816025307.24445.2437579460406974044.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 23:10:53 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Wed, 16 Dec 2020 16:41:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/945433be3677955255fabecbf1076c17864ff9da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
