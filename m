Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29625753BAC
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 15:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjGNNWH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 09:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbjGNNWG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 09:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9DC134
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689340877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Y4NusFAHnXM7wSO9A3THyK4bUF1CE/Jeg+u/1adZZk0=;
        b=I3OjVmxMsUIINrCoVy5nbMVBjBFK9kuLmVff0n5oBiA1R5aCkpP4rJyo6p4QTQqeTY7Bj5
        xK0/fn5rUO409Xigo9MNqJXy8s9t/wij388jUwdoCj0KC+fnuvecmdDS09EKdDwTDZ1FBs
        GwK5EBpIvrOIXzNbKS4FSvKjx+V0S5Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-oKSO81eJOeuqtSciIfB-0g-1; Fri, 14 Jul 2023 09:21:16 -0400
X-MC-Unique: oKSO81eJOeuqtSciIfB-0g-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b7355cab4fso18819011fa.1
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 06:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689340874; x=1691932874;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4NusFAHnXM7wSO9A3THyK4bUF1CE/Jeg+u/1adZZk0=;
        b=AqcVa80Os89KWMcT2Ha40obzLmo8etqvVD0u4DoENNQGHycCNcrnnu6iCk97rWw/j3
         h7oYXPY1wwT4/chnv90O/AY15tLCQ0Bag/MbfESPZ/Y/PZx9TAtuX76RVQsWpJ07TRT5
         9pA0hNdjH399F6ANNUU9in8oHdJhyiWZGyWFXqyTG+SmEg4Vy4AKJylwKNkqf7gAe2Qb
         3JLnLziP7nLO7xgrzrxzdDaRc0cmw9FaH7IUPg3cZK+9Q58gOgLUL8jCZ1fCRd1W88f+
         js/tHdqw82WlWyC+8zbkVs+x7l1PtFwuMVlfPXcjYJgMxNXs0kAn7eFqOSWn/cs6pBqj
         fuqw==
X-Gm-Message-State: ABy/qLbofursdpFZk9s5e04wOrC81d3xUfS6MXGXkZTTzDKJt1O8faB7
        38Myq+b9CyYxOTgEv2uNKvMQxOj5CJKMu4yJjidv0oxKUIKc88RcVN5Su8Y2C+Y838U4p7ZHhoC
        yuK0Sh4bqwmPiBKGngpRqR1xP1M7Oeg==
X-Received: by 2002:a05:651c:120e:b0:2b6:fa60:85a1 with SMTP id i14-20020a05651c120e00b002b6fa6085a1mr3889907lja.21.1689340874137;
        Fri, 14 Jul 2023 06:21:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGW1rnruL+JxVUIytPrOcvEAJfMJwbtjspEt0M7HvadmaG6ld9Xinosy32V7GjcuvzXGt6QqA==
X-Received: by 2002:a05:651c:120e:b0:2b6:fa60:85a1 with SMTP id i14-20020a05651c120e00b002b6fa6085a1mr3889886lja.21.1689340873748;
        Fri, 14 Jul 2023 06:21:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g14-20020a17090613ce00b00992665694f7sm5397545ejc.107.2023.07.14.06.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:21:12 -0700 (PDT)
Message-ID: <f16a15a8-aa32-214d-7896-af598e9d5000@redhat.com>
Date:   Fri, 14 Jul 2023 15:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Henning Schild <henning.schild@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between pdx86 and LED due for the v6.6
 merge window
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee, Guenter,

Here is a pull-request for some pending pdx86 simatic-ipc changes which
are a pre-requisite for merging the follow LED patch:

https://lore.kernel.org/linux-leds/20230713115639.16419-3-henning.schild@siemens.com/

(Guenter this also includes the watchdog change you acked for merging through
the pdx86 tree in case you want to merge this into the wd tree)

Regards,

Hans


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/ib-pdx86-simatic-v6.6

for you to fetch changes up to 8766addf665e9f0ace15cca894ba225e5a4d580a:

  platform/x86: simatic-ipc: use extra module loading for watchdog (2023-07-14 15:06:40 +0200)

----------------------------------------------------------------
Immutable branch between pdx86 simatic branch and LED due for the v6.6 merge window

v6.5-rc1 + recent pdx86 simatic-ipc patches for
merging into the LED subsystem for v6.6.

----------------------------------------------------------------
Henning Schild (7):
      platform/x86: simatic-ipc: add another model BX-21A
      watchdog: simatic-ipc-wdt: make IO region access of one model muxed
      platform/x86: simatic-ipc: add CMOS battery monitoring
      platform/x86: simatic-ipc: drop PCI runtime depends and header
      platform/x86: simatic-ipc: add another model
      platform/x86: simatic-ipc: add auto-loading of hwmon modules
      platform/x86: simatic-ipc: use extra module loading for watchdog

 drivers/platform/x86/Kconfig                       |  49 +++-
 drivers/platform/x86/Makefile                      |   6 +-
 drivers/platform/x86/simatic-ipc-batt-apollolake.c |  51 +++++
 .../platform/x86/simatic-ipc-batt-elkhartlake.c    |  51 +++++
 drivers/platform/x86/simatic-ipc-batt-f7188x.c     |  70 ++++++
 drivers/platform/x86/simatic-ipc-batt.c            | 252 +++++++++++++++++++++
 drivers/platform/x86/simatic-ipc-batt.h            |  20 ++
 drivers/platform/x86/simatic-ipc.c                 | 119 ++++++++--
 drivers/watchdog/simatic-ipc-wdt.c                 |   9 +-
 include/linux/platform_data/x86/simatic-ipc-base.h |   4 +-
 include/linux/platform_data/x86/simatic-ipc.h      |   4 +-
 11 files changed, 607 insertions(+), 28 deletions(-)
 create mode 100644 drivers/platform/x86/simatic-ipc-batt-apollolake.c
 create mode 100644 drivers/platform/x86/simatic-ipc-batt-elkhartlake.c
 create mode 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c
 create mode 100644 drivers/platform/x86/simatic-ipc-batt.c
 create mode 100644 drivers/platform/x86/simatic-ipc-batt.h

