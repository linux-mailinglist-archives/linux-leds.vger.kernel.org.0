Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD08DACCC7
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 14:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbfIHMlj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 08:41:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38492 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfIHMlj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 08:41:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id d10so6171177pgo.5;
        Sun, 08 Sep 2019 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uCI3lp4ERF6nH+uDgeAT16tjKctzMAW92RbCI6kFOKk=;
        b=BvCrbb+UOm276T7buZFTKAXwz0Wecr6aMgBPM81mdo0rC4KOoEK3Cj7Xe+v2RkXwpf
         THF/jujjHeoZTEkXd4al/Yvbsn19/FbkNJO/LE+zTEmR7BKnTgTSqotQzVvGLRB9sco5
         ABV1s3PlaTXKFhwlCJSoRPmt8/blgAYyh5mFe8eULE7D8k9KcGJmXtxGEoUa+GLji3gq
         6lEENlZTJ7u2cHwFH24ZAcQRH9HeRE3uq7vdFB5vSfXfYk2PqzvVihVXWk0bkfoheEVY
         vOIRDIoKKUfzBdN0LKJcqdpfUJ8YLSo1mL0aGlXXw/gJbloDRYOZb6zOBQKS1s0oqnvo
         pW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uCI3lp4ERF6nH+uDgeAT16tjKctzMAW92RbCI6kFOKk=;
        b=CN0/YWMRJ4yOR2vTatPWHEFa5iOEPg2FkVgsP0RhGZ8nAYZR+WAI/oYfGnrFLcbBuY
         dbqRoblpf5qGLEppL3Obpqt60ANgKFWJao1kLxdVO5nJCtsct591o130m+Efh+GtOBeI
         OqU5ksZdIi29cBEFouPXEVhgKksnFowUp1HlYUDvXJBPp5cJqwMSRsTC7Fw29P4NVkzP
         IwwQqFqWWKigXAbkkrTQnN7yDFwQHxOcWZe3GhbIb23gNGk4ntBF8dFcmE1809WYV6q8
         hOfU2XQOeTgQHhlibXwGGYBK08EkNwlLWQBGr8fQMbD2KeCXrXPrw82y5TpaUhdpVfdK
         Y/DQ==
X-Gm-Message-State: APjAAAWPa1NIHO+++ivNdfE6mH0GYnGTWCJnLaNd3V3AFPXvLUr01eNy
        jS+zE/k6Rd2dtbgyYGwi3Lhv+wA8
X-Google-Smtp-Source: APXvYqx4jJ8C5V/B1k0m6KPTG7h/WW3x5i/MleUlKXmXIHY06JO2MgxNAd9IUgApHpCHG6RFvpisEw==
X-Received: by 2002:a17:90a:9512:: with SMTP id t18mr20146166pjo.129.1567946498229;
        Sun, 08 Sep 2019 05:41:38 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:cae:1d92:a912:df67])
        by smtp.gmail.com with ESMTPSA id s7sm10879582pjn.8.2019.09.08.05.41.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 05:41:37 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/5] driver core: class: add function to create /sys/class/<class>/foo directory
Date:   Sun,  8 Sep 2019 21:41:10 +0900
Message-Id: <1567946472-10075-4-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds a new function class_kobject_create_and_add() that creates a
directory in the /sys/class/<class>.

This function is required to create the /sys/class/leds/triggers directory
that contains all available LED triggers.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/base/class.c   | 7 +++++++
 include/linux/device.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/base/class.c b/drivers/base/class.c
index d8a6a58..f4c53e7 100644
--- a/drivers/base/class.c
+++ b/drivers/base/class.c
@@ -104,6 +104,13 @@ void class_remove_file_ns(struct class *cls, const struct class_attribute *attr,
 		sysfs_remove_file_ns(&cls->p->subsys.kobj, &attr->attr, ns);
 }
 
+struct kobject *class_kobject_create_and_add(const char *name,
+					     struct class *cls)
+{
+	return kobject_create_and_add(name, &cls->p->subsys.kobj);
+}
+EXPORT_SYMBOL_GPL(class_kobject_create_and_add);
+
 static struct class *class_get(struct class *cls)
 {
 	if (cls)
diff --git a/include/linux/device.h b/include/linux/device.h
index 6717ade..335e901 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -505,6 +505,9 @@ static inline void class_remove_file(struct class *class,
 	return class_remove_file_ns(class, attr, NULL);
 }
 
+struct kobject * __must_check class_kobject_create_and_add(const char *name,
+							   struct class *cls);
+
 /* Simple class attribute that is just a static string */
 struct class_attribute_string {
 	struct class_attribute attr;
-- 
2.7.4

