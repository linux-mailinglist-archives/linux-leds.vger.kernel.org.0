Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0392C37B047
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 22:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhEKUub (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 16:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhEKUua (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 16:50:30 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF434C061574;
        Tue, 11 May 2021 13:49:23 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id t3so19460149iol.5;
        Tue, 11 May 2021 13:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I8R7x1c7Hd6UBScR8nVqjaGtYPLLSsOUFoINPtQV2yI=;
        b=nH7wOQdjKYb6s7Jy1bbcA4JVN4rsIiE/FQuQl16w8lbYz5f6TFsrGR8fk5ZVF6Sj17
         aGZKzanmmNSniNwaJlLRF2bpJNIpsswoiT351XfQYh+Tj1DkUF7P9znJvknEj6umSkC5
         jlGzeBA6wsSQ3dFSKz5hMA1Na0nELiOw6DsLyCZ5yo3WE6yINdKrNFA6atMlOU5hajWj
         LPrAQdSfV7jz+Oxg0x6rsVUS9oMDdWOVRE7Ri96BeCC1B+DfpeCIWaNOZKbzEFT/C8PO
         /iNyFyS/3Lw7ufHD+hw2QM/ZMUgGkP34JOhJyRes3eMAfg83EettB12z3JnV5bYg5tXE
         UlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I8R7x1c7Hd6UBScR8nVqjaGtYPLLSsOUFoINPtQV2yI=;
        b=MCZv8BUGTvhj3fBmJI2CVVSeAvp+Q1o329uRwJy0cgnmlJeAfPuyWDq9Ux7MVO2mzA
         UvK4K6Vn+eZgrBXS4fua14vhRKNH9XcTe8rFJ9aEpoiPX91PS7hk9V+2Uw1u8l5IvcNt
         WbH5ayoL4sPhh/Z9c9kNUf/FwT+pL6KlrhtPFVvFcHYb0x5Fd1lqwTE94yIdgDUCj8WA
         M3fHsWpENYam3xCpZgY5d2v2QgEivnu5ZkWHDRbquNifvhYnAMm/XohVWGCAQOyOMSf3
         vcYnUJKsH5hKfdnQo9nYLtcoHrWRytF73sPjcEFLFZ0MhcV+nTrvJZzI7Zx9SQVV4/4i
         8kRw==
X-Gm-Message-State: AOAM531xkpaEZ902WjfqHPsUD7OR39JE71B4E7K6+Rhli78Wp0yRE0qT
        3Da4bq5R3ygKCjua1X43GJs=
X-Google-Smtp-Source: ABdhPJxYyQFIyIPsZJxqXizYf8eK9bBtTD7v1lyx7UXns4BGxPzgRzvrMt768UJ0rsUSLQk3z4l2xA==
X-Received: by 2002:a6b:d10c:: with SMTP id l12mr23715805iob.179.1620766163490;
        Tue, 11 May 2021 13:49:23 -0700 (PDT)
Received: from zobel.corp.climate.com ([76.232.4.204])
        by smtp.gmail.com with ESMTPSA id p25sm4535851ioh.39.2021.05.11.13.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:49:23 -0700 (PDT)
From:   Doug Zobel <dougdev334@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Doug Zobel <dougdev334@gmail.com>
Subject: [PATCH 0/2] Device Tree support for LP5562 predefined patterns
Date:   Tue, 11 May 2021 15:48:32 -0500
Message-Id: <20210511204834.2675271-1-dougdev334@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for the LP5562 pre-defined LED patterns in Device Tree.

Doug Zobel (2):
  leds: lp55xx: support predefined pattern in Device Tree
  dt: bindings: lp55xx: Add predefined LED pattern

 .../devicetree/bindings/leds/leds-lp55xx.yaml | 103 +++++++++++++++++-
 drivers/leds/leds-lp55xx-common.c             |  94 ++++++++++++++--
 2 files changed, 186 insertions(+), 11 deletions(-)

-- 
2.20.1

