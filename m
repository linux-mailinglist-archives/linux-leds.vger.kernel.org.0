Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F420FB162A
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 00:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfILWLY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Sep 2019 18:11:24 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:57431 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbfILWLY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Sep 2019 18:11:24 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 5D89B1A24448;
        Fri, 13 Sep 2019 01:11:21 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Subject: v7 EL15203000
Date:   Fri, 13 Sep 2019 01:11:13 +0300
Message-Id: <20190912221115.23595-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[PATCH v8 1/2] dt-bindings: Add docs for EL15203000
[PATCH v8 2/2] leds: add LED driver for EL15203000 board

Changes what was made:
- removed odd spaces;
- use only one return in el15203000_pattern_set_P();
- reduce returns in el15203000_probe_dt();
- remove ret variable from el15203000_probe().

