Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9309FB1145
	for <lists+linux-leds@lfdr.de>; Thu, 12 Sep 2019 16:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbfILOkQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 10:40:16 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43003 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732592AbfILOkQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2019 10:40:16 -0400
Received: by mail-pf1-f193.google.com with SMTP id w22so16143775pfi.9;
        Thu, 12 Sep 2019 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=grnoPuXSB+fhOkpWySe4dZVDzqNaNF3BaUHoBD9OJYU=;
        b=GkROMBCaNxYGwtCM2uoDgNeklEj2m/GyemrwKDP4Qb5VZGgV5QvVyPB5vbMznziFfl
         30F5s2Ij35VfIMlosIQkYTV3O+jwR+XDwEhc8FkNU4JE7Y0s8ORsXvecaUt7IV/HRD5z
         g+F96YD/VM5W9oiyBNMbBDj1mCrVDdoBVyX7c9RAjbmiVFJcmFmHIfPR1f4s5TK3DMLT
         +ME8JR5HPdLTlLTx4krMO0Qd666jiWkAIYzy6OKDJRO48ormVDVAq/2Ajqajuf+odrWm
         BZOYI9Czd9CIPpIRZ5lNFKy2347RF6fkmCwOr9fq4tOVnfls3dU8iEwKf3wVtRU9F4xh
         cpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=grnoPuXSB+fhOkpWySe4dZVDzqNaNF3BaUHoBD9OJYU=;
        b=XrqrDJrEDKN5FN0+7OwEZ7KgdIPT+SiN9FdFW2y7DoQikXuzz6y2KF+StqVVMr6Ur4
         yIcbNJihlDxrtS8uwpSSaSJS3U2Utxo7q8oqb3ra3bPltTXYNW0CCswGspW2C0YU3DkN
         WIYcEx0d+FwIcru1Y1NOBJozU3Jg8gWoRVVIw9sr7v67ufjAuHV85CiIdVgOE8so4H17
         KuBcC2YUXcoKfD5+XGni0PlW0aL7ZSUtL61SfsHpS7w1USJLJHK9SdPVDUmODxDT0tIF
         zQjQUuKnJg1iQx/GC+bPCSOQG8b+7CqhvXhjCxXpJO3EvHvQrdp4/UroGYJ+OtMvpB3p
         mVLA==
X-Gm-Message-State: APjAAAU7EU1OanpCi6xEA6aCxfTplUF60XM2b1ubbeERKg4BrlRZYSg9
        qkrogq236Zjh57g+XnZkNBehNtqQ
X-Google-Smtp-Source: APXvYqzWeY6mqR3GiZaSi6dFzeQ0ioAIVSVZxJJq1b0fDmEQNBEgqJNdB4PNY+vZ4+ynl6x+HMIDkw==
X-Received: by 2002:a05:6a00:8c:: with SMTP id c12mr48129695pfj.200.1568299215715;
        Thu, 12 Sep 2019 07:40:15 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:a9d6:f377:69:9ad0])
        by smtp.gmail.com with ESMTPSA id b3sm42125514pfp.65.2019.09.12.07.40.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:40:14 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: fix /sys/class/leds/<led>/trigger
Date:   Thu, 12 Sep 2019 23:39:48 +0900
Message-Id: <1568299189-11074-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
However, the size of this file is limited to PAGE_SIZE because of the
limitation for sysfs attribute.

Enabling LED CPU trigger on systems with thousands of CPUs easily hits
PAGE_SIZE limit, and makes it impossible to see all available LED triggers
and which trigger is currently activated.

This patch converts /sys/class/leds/<led>/trigger to bin attribute and
removes the PAGE_SIZE limitation.

The first version of this seris provided the new api that follows the
"one value per file" rule of sysfs. This second version dropped it because
there have been a number of problems and it turns out that the new api
should be submitted separately.

* v2
- Update commit message
- Drop patches for new api

Akinobu Mita (1):
  leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger

 drivers/leds/led-class.c    |  8 ++--
 drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
 drivers/leds/leds.h         |  6 +++
 include/linux/leds.h        |  5 ---
 4 files changed, 79 insertions(+), 30 deletions(-)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
-- 
2.7.4

