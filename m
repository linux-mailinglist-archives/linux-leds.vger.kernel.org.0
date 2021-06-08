Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A79939EECD
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jun 2021 08:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhFHGiH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Jun 2021 02:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHGiF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Jun 2021 02:38:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7E3C061787;
        Mon,  7 Jun 2021 23:36:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id g20so30784285ejt.0;
        Mon, 07 Jun 2021 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyz3cZbCbRoVfJRUS8v4Ft8AG2jAgm+qZ3cfXbaej6U=;
        b=dSfprYsR/BmZkNJ44n2lQw57EHFTwaRoGx+o0Q9KTQFhvdqXjBkfybT9G7Mtbmrqym
         okWlzT0Lt8rrm/rcSGfONkfSuovyWLHhKRF/Pr4rzgPKWT9Mv2LmBC86QE6W4RPInUno
         ThecGMIo6CKcNyfA28F59MCoQbRzwG3394+PgsE/V/cQGr/S0ucagif0LtCUaDGYDeaU
         b0B6yARlXnGEYNPT7th+wgZl2AyIdwuRuBJiyl1YdabBPQUKASBcUNy3RTM15Ay9Mky+
         RhkS6hUwsXIx1UejCb+NUP9vRVCk7TyWrg2yq9Xg2ukckTyM7xz+z4f+muMu7P2iMNXJ
         V/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyz3cZbCbRoVfJRUS8v4Ft8AG2jAgm+qZ3cfXbaej6U=;
        b=R2S4i4K81P57UReMls1cJ25JKMkILwcDqxxkM3NdfoJr1tOquV9F9BmUAADL/1gJB3
         WFqgbiC7tHQKW8c7J+/7p0bDkaGmxK0i374mRQ2myEPqq3e6RZwgMpaAT7gw7Rpm6bMX
         VbxEl4CaYVamq0qKLNaThg9M+v8XSIrNFb5ubkKe9KOrX1qdTQ774DAsUffKoyX6axTJ
         5JdY302c4Flk+1ERiXf3LlGP9QuH1WzIPsrcz8cMExMwGuNDAt5xQ+j79d7sDy4IltTo
         ztqAELIq9RbhuWeb5JT8yK79g/UWHmySuAtF88JbZIRF+BvNKP8tGkGwfYexhF1LeIXa
         JA4Q==
X-Gm-Message-State: AOAM531G/yJkWfaZ1rcmjKhj1Edwnb+hHFUUjQCGYWEEYGLGHxqTt6lf
        rxmjDJmJWl2KCg33MJz+flU=
X-Google-Smtp-Source: ABdhPJxCpLo3iDn84mcmVh1lTNzCw6jl40TzQIQpkwLR46Yppbigr0PAjsOZkJaG5m8GC1MUJeTa7w==
X-Received: by 2002:a17:906:d1d1:: with SMTP id bs17mr21767836ejb.492.1623134170511;
        Mon, 07 Jun 2021 23:36:10 -0700 (PDT)
Received: from fujitsu.fritz.box (p200300da6709910000b233666d22ecd9.dip0.t-ipconnect.de. [2003:da:6709:9100:b2:3366:6d22:ecd9])
        by smtp.gmail.com with ESMTPSA id ot30sm6698168ejb.61.2021.06.07.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:36:10 -0700 (PDT)
From:   Denis Osterland-Heim <denis.osterland.heim@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     denis.osterland@diehl.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] leds: pwm: add support for default-state device
Date:   Tue,  8 Jun 2021 08:35:52 +0200
Message-Id: <20210608063554.6590-1-denis.osterland.heim@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v7 -> v8:
 - apply and test on newest kernel
 - drop docu patch, because it is already documented

Denis Osterland-Heim (2):
      leds: move default_state read from fwnode to core
      leds: pwm: add support for default-state device property

 drivers/leds/led-core.c  | 15 +++++++++++++++
 drivers/leds/leds-gpio.c | 12 ++----------
 drivers/leds/leds.h      |  1 +
 include/linux/leds.h     | 12 +++++++++---
 4 files changed, 27 insertions(+), 13 deletions(-)

Message-Id: <20200731164945.19515-1-Denis.Osterland@diehl.com>
base-commit: e90abb95bc71566e2016964e98181557929f55f5


