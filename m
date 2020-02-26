Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7251703D3
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 17:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgBZQLG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 11:11:06 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:39686 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZQLG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 11:11:06 -0500
Received: by mail-pf1-f177.google.com with SMTP id 84so3965pfy.6
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=v7AQPU9Fv5E/Kc0OdfIrkgIof7ggQU3UMYyS86xbo/A=;
        b=mVn2CG/JiXMCLMJXB4ZnNQPG+Y8v5PNjS4yzlOlNvnpo8YZolbWGVUbroNGUtzQmYK
         E250xtE8ELbovHEaqhxp4+8XbpRteFZIf9r5Di61kvxhG6s7CxWhEcJ7KR2HAp8cnCbx
         4IYzsbUt5VcIr1mCc5/V4nDjbRxCIK2oH+mEi4XoQPU7iaGi3R6uXRVm1R+Bt1rfTT4V
         N9bWoLEpl+NEoAlIDc1BExZFHJ8bEfM1bSQnMYrgwRM5HMZrSegQSW+5RbsJokllbr6W
         3/uNgd4+SwrW9LRGzxNe611t0xnjI5T4kNS15h0Eyy0fhgPt8+nZCxb4VSkG0BvjO3Fj
         j2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v7AQPU9Fv5E/Kc0OdfIrkgIof7ggQU3UMYyS86xbo/A=;
        b=tKWXXQlXV5oF5gtC6WXYJats2eBEw2rqM1pH3bw1viUifZue79Kr8AeUOGKgByE9c1
         HhE3HZWa0bE6ReFIszyOnl8nWc17woCtgY2Ya6VapQy1FAeZd2gc8A7nX/e7JhqNQfRM
         tORqGCgk/W/bEU1GgftnGpvvS26pdZFCJnjb1m3oswpRz09AD3O/j4XdOYgOvVs8Hbin
         AGEWUhSzfsvzm6M5s2VFGV1RSdj8/XNaS8gKZDighoCCsVCC34lnuilgrfPRf+Ujqj72
         82ED/ehs91+FFNbCE/N4RQjDhCAnUE+qNHgTFhOomL6dNCBd4sz+l9WPBNCYu7eaKk4s
         NDzw==
X-Gm-Message-State: APjAAAUviB7S0tXr6kH3xHpVKDZbCllnJKskjU6BDUARtPyeu7jSpQaG
        6LhvkDfGyFYZmm8Yej0GgAw=
X-Google-Smtp-Source: APXvYqxVTLPubiOOILg/mqf9K3+vQq+iP1g7u2DY1JDNZx8UAN/vegDTUrjRGcYcDj8ojjvvaJpmwg==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr5018026pfq.66.1582733463764;
        Wed, 26 Feb 2020 08:11:03 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 72sm3687697pfw.7.2020.02.26.08.11.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 08:11:02 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     pavel@ucw.cz, florian@openwrt.org, yuasa@linux-mips.org,
        jacek.anaszewski@gmail.com, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH v2] leds: use devm_platform_ioremap_resource() API to simplify code
Date:   Thu, 27 Feb 2020 00:10:56 +0800
Message-Id: <cover.1582732388.git.chenqiwu@xiaomi.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Dear Florian and Yoichi,

Could you please help review and test this patch?

chenqiwu (1):
  leds: use devm_platform_ioremap_resource() API to simplify code

 drivers/leds/leds-cobalt-qube.c | 20 +++++++++++---------
 drivers/leds/leds-cobalt-raq.c  | 12 ++++--------
 2 files changed, 15 insertions(+), 17 deletions(-)

-- 
1.9.1

Thanks a lot!
Qiwu
