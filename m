Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754299DE3E
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 08:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfH0GzC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 02:55:02 -0400
Received: from chill.innovation.ch ([216.218.245.220]:47528 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfH0GzC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 02:55:02 -0400
X-Greylist: delayed 511 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Aug 2019 02:55:02 EDT
Date:   Mon, 26 Aug 2019 23:46:30 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch ECBAB640132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1566888390;
        bh=Ah4HoPTCEDys+KZIwZcpIqNxpxt+QSkeND62vXqAbMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eXg7X0UeatuHe+nK4BBBMbXT1HwaaSdUsSRdFqdB6rp6Fy5USJEi+0jaPw1NH/mxu
         AYko1Ta5yZX0yHyB/inWCZIgSfK8EDwMA5bOk3FVPDdiB65Cz7jmkPBiMV/5jMIfTg
         NXsgTZIuB5GHpYDUZcs0omNMp6GMkbynh/hQfT/AazDDwBTDdaZujRTj2Rpw47VaFy
         aKySGGLH5AZeTTG9aKf+3ubDFuSqM7pY3HJ7ywl+Z/rmWDU62M9kiCyogVzQP/mfHG
         H1v6V8SWen/oqhXQO00pXZOW/0FoPzn7tqzAgjLZMjyl1W5w885Kqqt3IfZbFVDQtj
         GrBAxEAe237NA==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-leds@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [j.anaszewski-leds:for-next 15/49]
 drivers/input/keyboard/applespi.c:1789: undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <20190827064630.GA15193@innovation.ch>
References: <201908250600.zVS5YXcp%lkp@intel.com>
 <38ecf451-5acc-1fef-1527-18546b282d8d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38ecf451-5acc-1fef-1527-18546b282d8d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


  Hi Jacek,

On Sun, Aug 25, 2019 at 12:58:59AM +0200, Jacek Anaszewski wrote:
> 
> You're missing LEDS_CLASS dependency in Kconfig:
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 8e9c3ea9d5e7..96285e071ee1 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -76,6 +76,7 @@ config KEYBOARD_APPLESPI
>         depends on ACPI && EFI
>         depends on SPI
>         depends on X86 || COMPILE_TEST
> +       depends on LEDS_CLASS
>         help
>           Say Y here if you are running Linux on any Apple MacBook8,1 or
> later,
>           or any MacBookPro13,* or MacBookPro14,*.

This patch is already present in v5.3-rc4 - I can't tell from the
below what version you were testing, but apparently an older one?

> On 8/25/19 12:03 AM, kbuild test robot wrote:
> > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
> > head:   fd81d7e946c6bdb86dbf0bd88fee3e1a545e7979
> > commit: b2b998c0f944993c9ef435569651e407d607af41 [15/49] leds: class: Improve LED and LED flash class registration API
> > config: i386-randconfig-h002-201934 (attached as .config)
> > compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
> > reproduce:
> >         git checkout b2b998c0f944993c9ef435569651e407d607af41
> >         # save the attached .config to linux build tree
> >         make ARCH=i386 
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    ld: drivers/input/keyboard/applespi.o: in function `applespi_probe':
> >>> drivers/input/keyboard/applespi.c:1789: undefined reference to `devm_led_classdev_register_ext'
> > 
> > vim +1789 drivers/input/keyboard/applespi.c
> > 
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1620  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1621  static int applespi_probe(struct spi_device *spi)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1622  {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1623  	struct applespi_data *applespi;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1624  	acpi_handle spi_handle = ACPI_HANDLE(&spi->dev);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1625  	acpi_status acpi_sts;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1626  	int sts, i;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1627  	unsigned long long gpe, usb_status;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1628  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1629  	/* check if the USB interface is present and enabled already */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1630  	acpi_sts = acpi_evaluate_integer(spi_handle, "UIST", NULL, &usb_status);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1631  	if (ACPI_SUCCESS(acpi_sts) && usb_status) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1632  		/* let the USB driver take over instead */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1633  		dev_info(&spi->dev, "USB interface already enabled\n");
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1634  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1635  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1636  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1637  	/* allocate driver data */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1638  	applespi = devm_kzalloc(&spi->dev, sizeof(*applespi), GFP_KERNEL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1639  	if (!applespi)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1640  		return -ENOMEM;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1641  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1642  	applespi->spi = spi;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1643  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1644  	INIT_WORK(&applespi->work, applespi_worker);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1645  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1646  	/* store the driver data */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1647  	spi_set_drvdata(spi, applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1648  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1649  	/* create our buffers */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1650  	applespi->tx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1651  					   GFP_KERNEL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1652  	applespi->tx_status = devm_kmalloc(&spi->dev, APPLESPI_STATUS_SIZE,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1653  					   GFP_KERNEL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1654  	applespi->rx_buffer = devm_kmalloc(&spi->dev, APPLESPI_PACKET_SIZE,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1655  					   GFP_KERNEL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1656  	applespi->msg_buf = devm_kmalloc_array(&spi->dev, MAX_PKTS_PER_MSG,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1657  					       APPLESPI_PACKET_SIZE,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1658  					       GFP_KERNEL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1659  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1660  	if (!applespi->tx_buffer || !applespi->tx_status ||
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1661  	    !applespi->rx_buffer || !applespi->msg_buf)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1662  		return -ENOMEM;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1663  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1664  	/* set up our spi messages */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1665  	applespi_setup_read_txfrs(applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1666  	applespi_setup_write_txfrs(applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1667  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1668  	/* cache ACPI method handles */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1669  	acpi_sts = acpi_get_handle(spi_handle, "SIEN", &applespi->sien);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1670  	if (ACPI_FAILURE(acpi_sts)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1671  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1672  			"Failed to get SIEN ACPI method handle: %s\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1673  			acpi_format_exception(acpi_sts));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1674  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1675  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1676  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1677  	acpi_sts = acpi_get_handle(spi_handle, "SIST", &applespi->sist);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1678  	if (ACPI_FAILURE(acpi_sts)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1679  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1680  			"Failed to get SIST ACPI method handle: %s\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1681  			acpi_format_exception(acpi_sts));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1682  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1683  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1684  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1685  	/* switch on the SPI interface */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1686  	sts = applespi_setup_spi(applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1687  	if (sts)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1688  		return sts;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1689  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1690  	sts = applespi_enable_spi(applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1691  	if (sts)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1692  		return sts;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1693  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1694  	/* setup the keyboard input dev */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1695  	applespi->keyboard_input_dev = devm_input_allocate_device(&spi->dev);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1696  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1697  	if (!applespi->keyboard_input_dev)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1698  		return -ENOMEM;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1699  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1700  	applespi->keyboard_input_dev->name = "Apple SPI Keyboard";
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1701  	applespi->keyboard_input_dev->phys = "applespi/input0";
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1702  	applespi->keyboard_input_dev->dev.parent = &spi->dev;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1703  	applespi->keyboard_input_dev->id.bustype = BUS_SPI;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1704  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1705  	applespi->keyboard_input_dev->evbit[0] =
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1706  			BIT_MASK(EV_KEY) | BIT_MASK(EV_LED) | BIT_MASK(EV_REP);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1707  	applespi->keyboard_input_dev->ledbit[0] = BIT_MASK(LED_CAPSL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1708  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1709  	input_set_drvdata(applespi->keyboard_input_dev, applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1710  	applespi->keyboard_input_dev->event = applespi_event;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1711  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1712  	for (i = 0; i < ARRAY_SIZE(applespi_scancodes); i++)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1713  		if (applespi_scancodes[i])
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1714  			input_set_capability(applespi->keyboard_input_dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1715  					     EV_KEY, applespi_scancodes[i]);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1716  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1717  	for (i = 0; i < ARRAY_SIZE(applespi_controlcodes); i++)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1718  		if (applespi_controlcodes[i])
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1719  			input_set_capability(applespi->keyboard_input_dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1720  					     EV_KEY, applespi_controlcodes[i]);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1721  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1722  	for (i = 0; i < ARRAY_SIZE(applespi_fn_codes); i++)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1723  		if (applespi_fn_codes[i].to)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1724  			input_set_capability(applespi->keyboard_input_dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1725  					     EV_KEY, applespi_fn_codes[i].to);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1726  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1727  	input_set_capability(applespi->keyboard_input_dev, EV_KEY, KEY_FN);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1728  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1729  	sts = input_register_device(applespi->keyboard_input_dev);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1730  	if (sts) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1731  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1732  			"Unable to register keyboard input device (%d)\n", sts);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1733  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1734  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1735  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1736  	/*
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1737  	 * The applespi device doesn't send interrupts normally (as is described
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1738  	 * in its DSDT), but rather seems to use ACPI GPEs.
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1739  	 */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1740  	acpi_sts = acpi_evaluate_integer(spi_handle, "_GPE", NULL, &gpe);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1741  	if (ACPI_FAILURE(acpi_sts)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1742  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1743  			"Failed to obtain GPE for SPI slave device: %s\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1744  			acpi_format_exception(acpi_sts));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1745  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1746  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1747  	applespi->gpe = (int)gpe;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1748  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1749  	acpi_sts = acpi_install_gpe_handler(NULL, applespi->gpe,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1750  					    ACPI_GPE_LEVEL_TRIGGERED,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1751  					    applespi_notify, applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1752  	if (ACPI_FAILURE(acpi_sts)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1753  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1754  			"Failed to install GPE handler for GPE %d: %s\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1755  			applespi->gpe, acpi_format_exception(acpi_sts));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1756  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1757  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1758  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1759  	applespi->suspended = false;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1760  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1761  	acpi_sts = acpi_enable_gpe(NULL, applespi->gpe);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1762  	if (ACPI_FAILURE(acpi_sts)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1763  		dev_err(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1764  			"Failed to enable GPE handler for GPE %d: %s\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1765  			applespi->gpe, acpi_format_exception(acpi_sts));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1766  		acpi_remove_gpe_handler(NULL, applespi->gpe, applespi_notify);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1767  		return -ENODEV;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1768  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1769  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1770  	/* trigger touchpad setup */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1771  	applespi_init(applespi, false);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1772  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1773  	/*
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1774  	 * By default this device is not enabled for wakeup; but USB keyboards
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1775  	 * generally are, so the expectation is that by default the keyboard
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1776  	 * will wake the system.
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1777  	 */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1778  	device_wakeup_enable(&spi->dev);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1779  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1780  	/* set up keyboard-backlight */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1781  	sts = applespi_get_saved_bl_level(applespi);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1782  	if (sts >= 0)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1783  		applespi_set_bl_level(&applespi->backlight_info, sts);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1784  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1785  	applespi->backlight_info.name            = "spi::kbd_backlight";
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1786  	applespi->backlight_info.default_trigger = "kbd-backlight";
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1787  	applespi->backlight_info.brightness_set  = applespi_set_bl_level;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1788  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15 @1789  	sts = devm_led_classdev_register(&spi->dev, &applespi->backlight_info);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1790  	if (sts)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1791  		dev_warn(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1792  			 "Unable to register keyboard backlight class dev (%d)\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1793  			 sts);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1794  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1795  	/* set up debugfs entries for touchpad dimensions logging */
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1796  	applespi->debugfs_root = debugfs_create_dir("applespi", NULL);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1797  	if (IS_ERR(applespi->debugfs_root)) {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1798  		if (PTR_ERR(applespi->debugfs_root) != -ENODEV)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1799  			dev_warn(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1800  				 "Error creating debugfs root entry (%ld)\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1801  				 PTR_ERR(applespi->debugfs_root));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1802  	} else {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1803  		struct dentry *ret;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1804  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1805  		ret = debugfs_create_bool("enable_tp_dim", 0600,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1806  					  applespi->debugfs_root,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1807  					  &applespi->debug_tp_dim);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1808  		if (IS_ERR(ret))
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1809  			dev_dbg(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1810  				"Error creating debugfs entry enable_tp_dim (%ld)\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1811  				PTR_ERR(ret));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1812  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1813  		ret = debugfs_create_file("tp_dim", 0400,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1814  					  applespi->debugfs_root, applespi,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1815  					  &applespi_tp_dim_fops);
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1816  		if (IS_ERR(ret))
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1817  			dev_dbg(&applespi->spi->dev,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1818  				"Error creating debugfs entry tp_dim (%ld)\n",
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1819  				PTR_ERR(ret));
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1820  	}
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1821  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1822  	return 0;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1823  }
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1824  
> > 
> > :::::: The code at line 1789 was first introduced by commit
> > :::::: 038b1a05eae6666b731920e46f47d8e2332e07ff Input: add Apple SPI keyboard and trackpad driver
> > 
> > :::::: TO: Ronald Tschalär <ronald@innovation.ch>
> > :::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> > 
> 
> -- 
> Best regards,
> Jacek Anaszewski


  Cheers,

  Ronald

