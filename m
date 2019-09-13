Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8228B22DE
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390433AbfIMPDl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 11:03:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46145 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390420AbfIMPDl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 11:03:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so18238822pfg.13;
        Fri, 13 Sep 2019 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bztEqJMrHA1fGFkAFV2znJLCLhbELSJhkz/+uYwGTSk=;
        b=hQiMZnPoWog/O+cXMT7nOr9DETT3+0AoDAix5Oz3FMB1TQdkJBfwMB/F1rEc/RU6G4
         J2mLpwkvmEqsCs2lbZopJ9tQXfeagxBIpyQk8p3PdliGIuWU4iC8IgUbXI8Cm3kgBav/
         5dWULR9yvMwc8X/h3gLf+nBmeyJWq+zSwWD3L0Q/y9jWozQrDgCiK7u+o0YCMe+MVrPF
         qXSE78q899fFAqd88pcXEPFjJ1mEVbhOrjKbMlb0VTjJvIy7eHS3CcGFURJYanSLmv9w
         olFvCBgTL+bmLN41bRItGTBpOWKfcazDs+KRrotSE8Z2rcYB+w+tmSypBF6LKkmpCEON
         qO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bztEqJMrHA1fGFkAFV2znJLCLhbELSJhkz/+uYwGTSk=;
        b=gdhHo7Jx1c6DKkirYYeJReT6pN6E6Uozyeb6WiLjt1kefzOCVe1SHHjajRlej/nu0m
         +9eVRCJIiEChVq1r05qGpQVxsdt/e2TVNA0YKlz40S6SiRF3aNVnQvA1MbYYAiLxCpqJ
         CEOzor05NGiSOORg2whivdx4oWD+v0eFEtkNaqLAkAdjsLhzIacz7CIpB5siouvLr9yJ
         N3ojWJ22l8B6DZrDLjYacHnj/h4zsFeTsU8FSq5ZWWNEvCRrxbOOM9HR8ww7pD+U2BSn
         unJbFtZu9sPvTbRCPScpT5KtQ5dtDk0nHGE5coRxW4+VkoM190iWLjytQfTKme0oXnk4
         V3aw==
X-Gm-Message-State: APjAAAW6mV6hCaPogstDIB5xtYz02rpUlP1nXvOMHvK+hr6iaX49RLgL
        TclXUwWL/8zpgXvGAqPiBJxHO0gC
X-Google-Smtp-Source: APXvYqxs3dQ3r6MWKtoPmmX0dkpZfa8fjN6Jfn2hB2eDkrZDYJ/R7+3uX5JgEYlgKJhIqmLb0MFFLQ==
X-Received: by 2002:a17:90a:8509:: with SMTP id l9mr5606118pjn.10.1568387020264;
        Fri, 13 Sep 2019 08:03:40 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:a4da:99f6:4d93:495b])
        by smtp.gmail.com with ESMTPSA id c8sm9551899pgw.37.2019.09.13.08.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:03:39 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 0/1] leds: fix /sys/class/leds/<led>/trigger
Date:   Sat, 14 Sep 2019 00:03:23 +0900
Message-Id: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

(Resending with the version tag in the subject)

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

