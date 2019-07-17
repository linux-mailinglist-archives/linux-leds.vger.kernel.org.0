Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195A46C2D5
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 23:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfGQV4V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 17:56:21 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37969 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfGQV4V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 17:56:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id az7so12671133plb.5
        for <linux-leds@vger.kernel.org>; Wed, 17 Jul 2019 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51G1ZrwDQpwS4On3JbDDoJESWHcdjmZQc54GlG3LsaE=;
        b=PNqxjfrNxiKuVgIsZznYTG12e3uHVofrAL8Ei54qAyEH6eAojnky0QamPNXj5FohRU
         L0TCMyYWNzdvRlbzMzrYlXemWJNdEW+cNS0rMrcrD+W8LCLfL3HEyLYDCu9CF9GQouL7
         bcMBvzcfSEXZXRhsz/EVwyC/+9/H/Mqz0HX/2jtrrV86hHatrdlEYo+7sHxNloSiiLf8
         5VLOVOyqTLDNYM/XiWamQTgJe3P+ZeU9OKHV0nYHxaydTxxrHn8AcnSii+a5mld9uZQp
         copAhz0pPrb2G1SG17LFwCmWnpTQrYgidadnTKkHxKulE+7rNvxUb0XwhovFRTCYKSJ6
         dMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51G1ZrwDQpwS4On3JbDDoJESWHcdjmZQc54GlG3LsaE=;
        b=Uy/e0vL0VPlQZUyA21ccXoVTc3oM4GFiIeAblQAfbfOmsufw95Bl+NPLFTBykIbByn
         xr210w5OOlbAsD2W0Uf7OVX/k4Qty7/p2bAEvRmVg6A4iWyDMGz5DHBo85paG8CkuTTY
         AE5uiz4E/TAVVmAKnk/lWJMA0p+W4UFQ5eCi8X87UsAlgxJQDqDkfqqjwtq5CsdcHJfh
         lffaeaW1v2783Ej+aFkMmIDFhvh08khK5qgXv4Pm9IyNIlcex7GwUS76bM0KSLyuiTa6
         PJv2tuG2Z8esip93ZrPIzagJSHUlF5nPfjScl4YqeLX/yRIAUaTQfI3/Z+/PJP/f5s1q
         Axdw==
X-Gm-Message-State: APjAAAUA1v9Tue3GY1gXHaTcp6b6GeZsYlS/jHdXyeD5bYLQxjL5Psgz
        mCV/do5sSi+zZjIaQTkkdxFKNDr+6451V9VYtt4qlcuBcaNujvGSWdhWhhK5DFQ18p8sm6lMRpM
        da13TzlJplmkBimqQB1UpChlBpe1Ee1dwJId0SqYoC94oMaBc4Hnu9iWSUe1cJNgtkhpMACej8A
        rr
X-Google-Smtp-Source: APXvYqwtrEeiV8m0Ttz7tbo7bxlsLeFR2aHtf47Fy7pbuDE+WGOc2bXdx+P71KzkZKnQow2aNy0xeg==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr44887815plf.140.1563400580384;
        Wed, 17 Jul 2019 14:56:20 -0700 (PDT)
Received: from nick-dell.logitech.com ([204.77.216.18])
        by smtp.gmail.com with ESMTPSA id q7sm32571258pff.2.2019.07.17.14.56.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 14:56:19 -0700 (PDT)
From:   Nick Stoughton <nstoughton@logitech.com>
To:     linux-leds@vger.kernel.org
Cc:     Nick Stoughton <nstoughton@logitech.com>
Subject: [PATCH 0/1] Resend leds-lp5562 allow firmware files up to the maximum length
Date:   Wed, 17 Jul 2019 14:56:05 -0700
Message-Id: <20190717215606.3053-1-nstoughton@logitech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


As requested, resending patch with git-send-email.

Nick Stoughton (1):
  leds: leds-lp5562 allow firmware files up to the maximum length

 drivers/leds/leds-lp5562.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
Nick Stoughton

