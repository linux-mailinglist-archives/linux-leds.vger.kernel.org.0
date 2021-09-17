Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291A940F1C8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Sep 2021 07:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhIQF40 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Sep 2021 01:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhIQF4Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Sep 2021 01:56:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB9CC061574;
        Thu, 16 Sep 2021 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ab85TIIe0iBKOWYSJmOx3jaBctrqZvrBuf/T7hyXLu0=; b=mqDjf2b+NHvZUV+L6fFWQfqEhr
        yRCenYEBfbiYkWEgB/eqFt5BEAydJSrEFbNZUflFz/kJVu9g7HN9UUZPG+fha9nWBu97HD/qIMARP
        YjYOYzZa+SNrqnAoHeIlC6wFIcPyUIuL0Zc4Q1OBSjfz28yIAqg2VnxSJzUG9eFbObtqFvdwbiGAd
        j4K6wTkyNYR0xHbvPm3eP266a4WCwVOEo6t/TUmJ1ZS5NxfaRc4vI4TZm4/dVWw3KehpZxgq+C6w2
        Nhy9EOTnFsYqJGsRld0ubUugGR3IzCzXIuiLNFATEkJHflMNKfmMgNJW9VhM4OQq1v4FsQglQZMwB
        fICYqKMg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mR6oQ-00HY9S-Oq; Fri, 17 Sep 2021 05:53:47 +0000
Date:   Fri, 17 Sep 2021 06:53:26 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
Subject: Re: [PATCH v4 2/2] leds: trigger: Add block device LED trigger
Message-ID: <YUQtVmwV90uab4/V@infradead.org>
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-3-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916202127.1216994-3-arequipeno@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 16, 2021 at 03:21:27PM -0500, Ian Pilcher wrote:
> +/* Block device information (BDI) - 1 per blkdev linked to at least 1 LED */
> +struct led_bdev_bdi {

It might be a good idea to pick a differene name.  BDI is a commonly
used shortcut for the backing device information used all over the block
layer and writeback code.

> +/* For many-to-many relationships between block devices and LEDs */
> +struct led_bdev_link {
> +	struct hlist_node	bdi_leds_node;
> +	struct hlist_node	led_bdis_node;
> +	struct led_bdev_bdi	*bdi;
> +	struct led_bdev_led	*led;
> +};


Why not just use a xarray to link them which due to the non-invasive
nature gets you n:m links "for free".

> +/* Forward declarations to make this file compile in a reasonable order */
> +static void led_bdev_process(struct work_struct *work);
> +static struct led_bdev_bdi *led_bdev_get_bdi(const char *buf, size_t size);
> +static struct block_device *led_bdev_get(const char *buf, size_t size,
> +					 fmode_t mode);
> +static int led_bdev_link(struct led_bdev_led *led, struct led_bdev_bdi *bdi);
> +static void led_bdev_put_bdi(struct led_bdev_bdi *bdi);
> +static void led_bdev_bdi_release(struct device *dev, void *res);
> +static void led_bdev_unlink(struct led_bdev_led *led,
> +			    struct led_bdev_link *link,
> +			    struct led_bdev_bdi *bdi, bool releasing);
> +static void led_bdev_update_bdi(struct led_bdev_bdi *bdi);
> +static bool led_bdev_blink(const struct led_bdev_led *led,
> +			   const struct led_bdev_bdi *bdi);

I seriously question the "reasonable" above if you need that many
forward declarations in brand new code.

> +static struct block_device *led_bdev_get(const char *const buf,
> +					 const size_t count, fmode_t mode)
> +{
> +	static const char dev[] = "/dev/";
> +	struct block_device *bdev;
> +	char *dev_path, *path;
> +
> +	/* sizeof(dev) includes terminating null */
> +	dev_path = kmalloc(sizeof(dev) + count, GFP_KERNEL);
> +	if (dev_path == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* sizeof(dev) - 1 is compile-time equivalent of strlen(dev) */
> +	memcpy(dev_path, dev, sizeof(dev) - 1);
> +	path = dev_path + sizeof(dev) - 1;
> +	memcpy(path, buf, count + 1);  /* include terminating null */
> +	strim(path);
> +
> +try_blkdev_get:
> +	bdev = blkdev_get_by_path(path, mode, THIS_MODULE);
> +	if (IS_ERR(bdev) && PTR_ERR(bdev) == -ENOENT && path != dev_path) {
> +		path = dev_path;
> +		goto try_blkdev_get;
> +	}
> +
> +	kfree(dev_path);
> +	return bdev;

Please just required the user to put in the whole path and remove all
this garbage.  There is no need to build your own broken wrappers around
the VFS path resolution.
