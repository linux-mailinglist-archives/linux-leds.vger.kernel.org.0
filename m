Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C42B752D
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 10:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388008AbfISIf2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 04:35:28 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:57298 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387617AbfISIf2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Sep 2019 04:35:28 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 3463A1A2443C;
        Thu, 19 Sep 2019 11:35:26 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Subject: v10 EL15203000
Date:   Thu, 19 Sep 2019 11:35:16 +0300
Message-Id: <20190919083518.21569-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[PATCH v10 1/2] dt-bindings: Add docs for EL15203000
[PATCH v10 2/2] leds: add LED driver for EL15203000 board

v10:
- move ASCII art to ABI/testing.

