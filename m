Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C1917E198
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 14:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgCINpw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 09:45:52 -0400
Received: from mail.manjaro.org ([176.9.38.148]:58810 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgCINpw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Mar 2020 09:45:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id C3A963701AC9;
        Mon,  9 Mar 2020 14:45:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oXfIn-hvP3mj; Mon,  9 Mar 2020 14:45:48 +0100 (CET)
Subject: Re: [RFC PATCH 1/1] leds: add generic inverted led trigger support
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200308142722.1199260-1-t.schramm@manjaro.org>
 <20200308142722.1199260-2-t.schramm@manjaro.org>
 <057e4efd-30a1-20df-d990-d11ef2573a3e@gmail.com>
From:   Tobias Schramm <t.schramm@manjaro.org>
Message-ID: <c799f3b7-2b55-0d8f-c54d-38b525d67e9c@manjaro.org>
Date:   Mon, 9 Mar 2020 14:46:52 +0100
MIME-Version: 1.0
In-Reply-To: <057e4efd-30a1-20df-d990-d11ef2573a3e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

thanks dor the feedback.

> We have already some triggers that accomplish that by introducing
> a custom sysfs file.
[...]
> You could also try to make this a generic feature
> for all LED triggers.

Based on the other feedback I got I will do just that. Pavel is right,
we do already have a lot of triggers, doubling the number of triggers is
probably not the best idea.

Tobias



