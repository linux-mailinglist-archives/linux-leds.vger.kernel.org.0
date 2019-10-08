Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BC5D0248
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 22:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbfJHUnI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 16:43:08 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44537 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbfJHUnI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 16:43:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so20922757wrl.11;
        Tue, 08 Oct 2019 13:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WWwn+BDhcbOGBxgKsYFakYG+EwuX3cbPf1a14GVaBTU=;
        b=OnuQJfIibD7d3RvSZZN35NnxUvR85Sf/r20VXLk3biySO4yxKmevZnQ/kQVQZ/Wzm6
         TzpLZvszOoDVaibLNoJA/ahk0O0T9QlGkTIHmwZiZ4CJgcRC5YpDXJlD/W0ivkvtGmeq
         HlgCzwBNy5j8T5q6+gZLDnujBLohWcmUz2+qRlk4AFF/WL4NS7+YYDhx1fpJZaauRlJ8
         x/m2ZZ028CerRFTrONV1FbnS5ass2/2Brt8FaHpKzgzNA0YiMigbxpWSHZEzpPGFpPGP
         bvlMZLIu0B2ZrzyWw2VkVE82pUFsd8XR0Vrh4U790DNdxADq8J62P0W+86GKW6S3+beD
         Mivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WWwn+BDhcbOGBxgKsYFakYG+EwuX3cbPf1a14GVaBTU=;
        b=UyfZ6oUBm+SxIXcNtnU2Mly2uTokKtALHJh0UbBvEAmpSArGw5H3aNIg7S6r4R1Igm
         UAXxt4ctiwTc8PTM1vlrtrYVcnzrpP+gWgoGH7E7kDZNZt3YJxk9mCcaHCXZ70vkTxOa
         8tL4Tt7YV3MrkQBB6HgqgA7sSqmVbkDmsrJGH1zw8h8ad2QXyB73t9b1jmts9Hozkko+
         Hs6Q/kvu6BRBeSdol/7M6ahJ9WctzCNERAxol6RjL/q5B/i0Q+JX/g5qZI0honKkge1p
         WX5uL7ul58fmjwuvc6+yD8lut+QDhX56TpaeIzylociUcl0DPcjhJA/vL2Ac67mxA7oO
         HqmQ==
X-Gm-Message-State: APjAAAVBl5AhJLLfukv45O2TNf4lx+zZltSmYX+U6n/t/vpBmlmWfLnk
        sWmjmcLC5USZoXNOOWOcmFj3eZ19
X-Google-Smtp-Source: APXvYqwcR1fV/EF1kGFCUEGey7i/HTucQnwdHVUFMdyl3+SmC/etQNtGJHI8CKcHrGRn+wnXKQKAbA==
X-Received: by 2002:a5d:6a09:: with SMTP id m9mr26979486wru.12.1570567386394;
        Tue, 08 Oct 2019 13:43:06 -0700 (PDT)
Received: from myhost.home (bgs228.neoplus.adsl.tpnet.pl. [83.28.82.228])
        by smtp.gmail.com with ESMTPSA id o22sm47057989wra.96.2019.10.08.13.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 13:43:05 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com
Subject: [GIT PULL] LED fixes for 5.4-rc3.
Date:   Tue,  8 Oct 2019 22:42:58 +0200
Message-Id: <20191008204258.22196-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Please pull two patches for 5.4-rc3:

- fix a leftover from earlier stage of development in the documentation
  of recently added led_compose_name() and fix old mistake in
  the documentation of led_set_brightness_sync() parameter name.

- MAINTAINERS: add pointer to Pavel Machek's linux-leds.git tree.
  Pavel is going to take over LED tree maintainership
  from myself.

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-5.4-rc3

for you to fetch changes up to 4050d21d2009faccae5cab74eeb9f460f25d5108:

  Add my linux-leds branch to MAINTAINERS (2019-10-08 22:09:08 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fixes for 5.4-rc3.
----------------------------------------------------------------
Dan Murphy (1):
      leds: core: Fix leds.h structure documentation

Pavel Machek (1):
      Add my linux-leds branch to MAINTAINERS

 MAINTAINERS          | 1 +
 include/linux/leds.h | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
