Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5F32045
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2019 19:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfFAR7z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 1 Jun 2019 13:59:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37628 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFAR7z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 1 Jun 2019 13:59:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so7793684wmo.2;
        Sat, 01 Jun 2019 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BYkXgNY0U7adwxf+eX0HDJFLqK4st7qAMyg+SlH4weE=;
        b=A/lnQ3jJzzU4nQ93jb13Rcu1z7AWhZMp2Q9Fdn5S0RmDrKg4ckmGAPFjw2wJj70we+
         q8jPM7A+a9UTDW21cyv+zN3NRhTtxO/oddRfSwpcRNX5hZipLoFYMSabcks0y1S7l5Yl
         kI4ZH387LU1snnpMhQuS1UVnEuL1vM256KdAxujro1bBHYyBjwQ6B35wJPDUZb6KaoLh
         6/tdiey/rlp1XHHQu9cmbWodomn2XiaVpq+/miSx31qe0F39avgsojhvODb3eEvWzSni
         UmiRE9unR+avro6evsyR7xPVIpkjuSH4q47y3P2k1jle/rBxYHT9LnZJ0Npc6G20NpHQ
         piRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BYkXgNY0U7adwxf+eX0HDJFLqK4st7qAMyg+SlH4weE=;
        b=o2C69mzH8mokZ9tjKuE8PWQK50xZtQbY/If20sW6Tnre4kfWhMy55YNqKxSMT7FO+Y
         x/WZ5Cyc/AJc9VJ+Vyef9bTfSYWQ1kA+wMqJNK2sC3mDR5wm0FSFhRvkYqJ0b69h4/OG
         MUGv34LyGJVzIy23eJxTRyA8Y9EjH1j0r8GG7wstB6QdJNNozIzyiKluhU238uvDt87O
         GrkRo30Vrg8gt6I887OM84aIUrQGrwVK1v9OyabvcqPP8m/7s4qNfCpWya02HHdCXYob
         lK5T5lkr4jnYgB0BN6ipvgtzMfu2llC1ezzOJeX4a2GWPjaNQxvSXnB1Ck4kseluowv2
         022Q==
X-Gm-Message-State: APjAAAVmtzWpR/zr9hW5Lr6CKz0KQ9WzyCHXO8nV72Kr8aEb9QCzzrwE
        VMa6GYmLJLHKEOStnqhU83A=
X-Google-Smtp-Source: APXvYqyU/Etqs+/+DvrlysvFrf0b809JqWh3xDpBiT+dFquUAmlXr07L7Cut5qfOwrzcKb0qHps/Xg==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr1873896wmf.154.1559411993071;
        Sat, 01 Jun 2019 10:59:53 -0700 (PDT)
Received: from myhost.home (bks10.neoplus.adsl.tpnet.pl. [83.28.186.10])
        by smtp.gmail.com with ESMTPSA id f24sm7512054wmb.16.2019.06.01.10.59.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 10:59:52 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Subject: [GIT PULL] LED fix for 5.2-rc3
Date:   Sat,  1 Jun 2019 19:59:44 +0200
Message-Id: <20190601175944.21297-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED fix for recent change in LED core,
that didn't take into account the possibility of calling
led_blink_setup() from atomic context.

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-5.2-rc3

for you to fetch changes up to 8c0f693c6effbc3f42f77a9e81209af9af20910c:

  leds: avoid flush_work in atomic context (2019-05-31 22:29:14 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 5.2-rc3
----------------------------------------------------------------
Pavel Machek (1):
      leds: avoid flush_work in atomic context

 drivers/leds/led-core.c              | 5 -----
 drivers/leds/trigger/ledtrig-timer.c | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
