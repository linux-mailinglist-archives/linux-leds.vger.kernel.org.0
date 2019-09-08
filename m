Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5FBBACCC1
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 14:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbfIHMl3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 08:41:29 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33800 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfIHMl2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 08:41:28 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so6184916pgc.1;
        Sun, 08 Sep 2019 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=s/uUNSET5cdcr9MP+ioNfRXeHELFVouyjnHy8zcY4NM=;
        b=RytNBVV3d3qtpwVlZKF9JsFPcA9qJBXwAzy9eqR3/VLYYpsSX/d4MIkPC9mOvINeeS
         h5oaijAL/poczro1/XQ7utZuwF9iRqDBLRsvUB21uC146xQ5c5cp5l6XQoQSQ2Brd3LH
         b7ODPRHrCcf1uVYrpruzcmiTjHEsGELLo8YO9uT+qK+gT9rv56GB5gmEz/xoEkOQzg0j
         nl+ri8nYu/ypaJ9hntz9eglAhVSuZyVOYsF/rFg4O0ScEGti/Ko25PAEKyxtdIhVkLYD
         Uu02Qe1LpCLBaxE93/mKIYBf6D5PE7QyfQhmd11nTCAO6N/PruEji1oP7XS8HXJ6VbRv
         H4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=s/uUNSET5cdcr9MP+ioNfRXeHELFVouyjnHy8zcY4NM=;
        b=A9CUd8ED96b/Z7fUX91IzJAbkYZbZQVz4bz6yqA1jbwcuzTmA02UFufFdCRtCZeX7G
         fRQ3qHwzxN2hMwpkkfwvTE6elsRbFrOjD4ufd0L9Si5zyw3xTZfsIdIFvGTGb2aMN7SX
         XA9mMjTdrTGi5M9mF/CafN6zTKR8sPUSt/+M/BSE9p4H+ME5YYfl5p0lSghLscb/2fHK
         COYv53b/4egGtd7WzbOwyue4/lLdOu+b6KIMCgJMIeQCrrVrUxkVmSG4Rl+NfJg73o3K
         fGM/SSHIcKQwEx1cJ0Eol2C+vTQZhTRljjQsZ3X2UT7QO8UBu/VtZoHlj+hqivEO7vuA
         Uh7A==
X-Gm-Message-State: APjAAAUVUMDBKZrwH5AalwzmbFsR4uh9RYOP7psn7hiT1lMBo7E7Fyhv
        RtFUzvwmGwLJLeyLYCFk09LRP+tj
X-Google-Smtp-Source: APXvYqyIRKncxESF4fbN0LmT5WXmFVB0OcHeYMSrMwIKmTyqtYclH7gVBz80d6/9E89rDx4bRkgv9w==
X-Received: by 2002:a63:124a:: with SMTP id 10mr16783420pgs.254.1567946487775;
        Sun, 08 Sep 2019 05:41:27 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:cae:1d92:a912:df67])
        by smtp.gmail.com with ESMTPSA id s7sm10879582pjn.8.2019.09.08.05.41.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 05:41:26 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/5] leds: fix /sys/class/leds/<led>/trigger and add new api
Date:   Sun,  8 Sep 2019 21:41:07 +0900
Message-Id: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
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

The first patch in this series converts /sys/class/leds/<led>/trigger to
bin attribute and removes the PAGE_SIZE limitation.

The rest of series provides a new /sys/class/triggers/ directory and
/sys/class/leds/<led>/current-trigger. The new api follows the "one value
per file" rule of sysfs.

Akinobu Mita (5):
  leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
  leds: make sure leds_class is initialized before triggers are
    registered
  driver core: class: add function to create /sys/class/<class>/foo
    directory
  leds: add /sys/class/triggers/ that contains trigger sub-directories
  leds: add /sys/class/leds/<led>/current-trigger

 Documentation/ABI/testing/sysfs-class-led |  22 +++++
 drivers/base/class.c                      |   7 ++
 drivers/leds/led-class.c                  |  49 +++++++++--
 drivers/leds/led-triggers.c               | 139 +++++++++++++++++++++++++-----
 drivers/leds/leds.h                       |  12 +++
 include/linux/device.h                    |   3 +
 include/linux/leds.h                      |   6 +-
 7 files changed, 207 insertions(+), 31 deletions(-)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
-- 
2.7.4

