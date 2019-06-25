Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F062521A4
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2019 06:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbfFYEFs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jun 2019 00:05:48 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:43336 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFYEFs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jun 2019 00:05:48 -0400
Received: by mail-qt1-f178.google.com with SMTP id w17so16917164qto.10;
        Mon, 24 Jun 2019 21:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XoSvE7N+j3Mxg/IlWBM7LJa1qcyCkhIFO08QDOH/raI=;
        b=aZEOJgBocvFcnzN3COTXh7aIr/gTmHFXM+R2u8j0mtd/ktaH/5E2KiFSboc7jqTj/h
         alfDJZPhA0GjokbKjupf3AhMI80ijLB9I/Zhx0bARILpwCMqpyKCS//ecExyEOplmeqN
         BLc5AI76ePPltb5EAnxkLXP/H/Q3WSMYjbk9b4T2gBWP8RkACXMR+HcqB/6hoGJCDzCj
         7TAzVU55bsuWOPZHIbNpS+QDyUO+dwzGaUhPazvQXlXIJ9KDVfS1v4FR5qg4Kf56YjBu
         1AZ4W4xNam/hll9H+fnBVeew6HRm0bNmAvsIyhfSMCCRV7M14jNE3ypaa6r3M6ApdAlZ
         v5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XoSvE7N+j3Mxg/IlWBM7LJa1qcyCkhIFO08QDOH/raI=;
        b=e240a3uJ7rZ7+fuHQrQwluGAdD6Z+Q7Vczm6WY+Z0GJILWZ1xY6O4wyaNXTxGB5Zy3
         NIyXasWZAn3FGnGtVqQm7QeXWsUSAFPlLd2yc0UaI1ZeRlCpFGWIFmULoetmKVxzxaYg
         Mqek7/o4P+j89BPvfwTr36gEkV0MOB7ntu840mNVmuXNlIWlY3leOXV41vMYK8e5JLBW
         5X8LTBt9PZVze7ZPLs4hzxVrPyX97WzErAuLEgOeCdO+ETc1P0Z9fawG2ZzGdTM6e3QP
         llsbYTDcgnZCku5pi+3WYGIwsyzw43Cj15QiZu+grcMs7CPuMxgSsxfewWF3RVWShL0L
         KyDA==
X-Gm-Message-State: APjAAAVJRimwAWw+CUGMRi3qWzROiMDDcoPTEUj806ZozBDyfMjv9AgN
        BT9ONvLPn4G3IKE8k/kO6NA=
X-Google-Smtp-Source: APXvYqzVgLl6NC4D8YY3vGIeOwlowXRytM35NnhS97fSyed0a2UigQzw125JadsbBPopKo7Dxfr+dg==
X-Received: by 2002:ac8:29c9:: with SMTP id 9mr106932315qtt.196.1561435546877;
        Mon, 24 Jun 2019 21:05:46 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 24 Jun 2019 21:05:46 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com
Subject: [PATCH 0/2] fix vendor prefix for arcxcnn driver and bindings
Date:   Tue, 25 Jun 2019 00:05:27 -0400
Message-Id: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


These two patches supercede the prior similar three-patch set 
submitted on 6 Mov 2018. Apologies for the confusion.

This patch is to update the arcxcnn backlight driver to use the
proper "arctic" vendor-prefix and document that in the device-
tree bindings.

There is at least one existing device using the old "arc"
vendor-prefix (Samsung Chromebook Plus), so support for that
remains in the driver source.

Unlike the previous patch set which hasn't been applied, there
there is no actual functionality change here.
